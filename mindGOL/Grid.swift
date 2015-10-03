//
//  Grid.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/2/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit


let GridRows = 8
let GridColumns = 10
let NEIGHBOR_COUNT: Int = 0
let LIGHTBLOCK_STATE: Int = 1

class Grid: SKSpriteNode {
    
    
    var lightBlockArray: [[LightBlock]]!
    var cellWidth: CGFloat = 0
    var cellHeight: CGFloat = 0
    
    var totalAlive = 0
    var generation = 0


    
    init(imageNamed:String, position: CGPoint, gridSize: CGSize, textureSize: CGSize, anchorPoint: CGPoint) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: textureSize)
        self.anchorPoint = anchorPoint
        self.size = gridSize
        self.position = position
        self.userInteractionEnabled = true
        setUpGrid()
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {

        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpGrid() {
        cellWidth = self.size.width / CGFloat(GridColumns)
        cellHeight = self.size.height / CGFloat(GridRows)
        lightBlockArray = []
        
        for row in 0..<GridRows {
            lightBlockArray.append([])
            
            for column in 0..<GridColumns {
                let lightBlock = LightBlock(imageNamed: "assets/bubble-blue.png")
                lightBlock.size.width = lightBlock.size.width * 0.7
                lightBlock.size.height = lightBlock.size.height * 0.7
                lightBlock.position = CGPoint(x: cellWidth * CGFloat(column) + 5,
                                              y: cellHeight * CGFloat(row) + 15 )
                addChild(lightBlock)
                lightBlockArray[row].append(lightBlock)
                lightBlock.zPosition = 10
                lightBlock.isAlive = false
            }
        }
    }
    
 
    
    func performStep() {
        //update each lightblock's neighbor count
        updateLightBlock(NEIGHBOR_COUNT)
        
        //update each lightblock's state
        updateLightBlock(LIGHTBLOCK_STATE)
        
        //Update generation
        generation++
    }
    
    
    func updateLightBlock(type:Int) {
        for var r = 0; r < lightBlockArray.count; r++ {
            for var c = 0; c < lightBlockArray[r].count; c++ {
                switch(type) {
                case NEIGHBOR_COUNT:
                    let currentLight = lightBlockArray[r][c]
                    currentLight.livingNeighbours = 0
                    
                    for var x = (r - 1); x <= (r + 1); x++ {
                        for var y = (c - 1); y <= (c + 1); y++ {
                            let valid = isValid(x: x, y: y)
                            
                            if !(x == r && y == c) && valid {
                                let neighbor = lightBlockArray[x][y]
                                
                                if neighbor.isAlive {
                                    currentLight.livingNeighbours++
                                }
                            }
                        }
                    }
                    break;
                case LIGHTBLOCK_STATE:
                    totalAlive = 0
                    let currentLight = lightBlockArray[r][c]
                    let liveNeighbors = currentLight.livingNeighbours
                    if liveNeighbors == 3 {
                        currentLight.isAlive = true
                    } else if liveNeighbors <= 1 || liveNeighbors >= 4 {
                        currentLight.isAlive = false
                    }
                    
                    if currentLight.isAlive {
                        totalAlive++
                    }
                    break;
                default:
                    break;
                }
            }
        }
    }
    
    
    func isValid(x x: Int, y: Int) -> Bool {
        return !(x < 0 || y < 0 || x >= GridRows || y >= GridColumns)
    }
    
    func touchPositionForLightBlock(touchPos: CGPoint) -> LightBlock {
        let row = Int(touchPos.y / cellHeight)
        let column = Int(touchPos.x / cellWidth)
        return lightBlockArray[row][column]
    }
   
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches
        let location = touch.first!.locationInNode(self)
        
        let lightBlock = touchPositionForLightBlock(location)

        lightBlock.isAlive = !lightBlock.isAlive
        
    }
}
