//
//  GameScene.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/2/15.
//  Copyright (c) 2015 ChunQhai. All rights reserved.
//

import SpriteKit

let nameNextBtn = "nextBtn"
let nameExitBtn = "exitBtn"

class GameScene: SKScene {
    
    var population = 0
    var generation = 0
 
    
    var bg = SKSpriteNode()

    
    var labelPopulation: Label!
    var labelGeneration: Label!
    var nextBtn: Button!
    var exitBtn: Button!
    var board: Board!
    var grid: Grid!
    
    
    override func didMoveToView(view: SKView) {
        userInteractionEnabled = true
        setUpUI()
    }
    
    func setUpUI() {
        // Setup Background
        let bgTexture = SKTexture(imageNamed: "assets/background.png")
        bg = SKSpriteNode(texture: bgTexture)
        bg.position = CGPoint(x: CGRectGetMidX(self.frame),y: CGRectGetMidY(self.frame))
        bg.size.height = self.frame.height
        bg.zPosition = -1
        self.addChild(bg)
        
        // Create Grid
        grid = Grid(imageNamed: "assets/grid.png",
                    position: CGPoint(x: (CGRectGetMidX(self.frame) / 2) * 0.33, y: (CGRectGetMidY(self.frame) / 2) * 0.7),
                    gridSize: CGSizeMake(( self.frame.size.height / 2.0 ) * 1.48 , (self.frame.size.width / 2) * 0.95),
                    textureSize: CGSizeMake(1200,1200),
                    anchorPoint: CGPoint(x: 0,y: 0))
        self.addChild(grid)
        GridHelper.addGrid(grid)
        
        // Create board
        board = Board(imageNamed: "assets/board.png",
            position: CGPoint(x: CGRectGetMidX(self.frame) * 1.6, y: CGRectGetMidY(self.frame) * 0.73))
        self.addChild(board)
        
        // Create start button
        nextBtn = Button(name: nameNextBtn,
            size: CGSizeMake(250,100),
            position: CGPoint(x: CGRectGetMidX(self.frame) * 1.6, y: CGRectGetMidY(self.frame) * 1.5),
            imageNamed: "assets/next.png")
        self.addChild(nextBtn)
        
        // Create pause button
        exitBtn = Button(name: nameExitBtn,
            size: CGSizeMake(250,100),
            position: CGPoint(x: CGRectGetMidX(self.frame) * 1.6, y: CGRectGetMidY(self.frame) * 1.25),
            imageNamed: "assets/exit.png")
        self.addChild(exitBtn)
        
        // Create label for population
        labelPopulation = Label(fontName: "Arial Black-Bold",
                                text: "0",
                                size: 50,
                                position: CGPoint(x: CGRectGetMidX(self.frame) * 1.6, y: CGRectGetMidY(self.frame) * 0.75),
                                zPosition: 10,
                                groupName: "lblPopulation")
        self.addChild(labelPopulation)
        LabelHelper.addLabelNode(labelPopulation)
        
        
        // Create label for generation
        labelGeneration = Label(fontName: "Arial Black-Bold",
                                text: "0",
                                size: 50,
                                position: CGPoint(x: CGRectGetMidX(self.frame) * 1.6, y: CGRectGetMidY(self.frame) * 0.41),
                                zPosition: 10,
                                groupName: "lblGeneration")
        LabelHelper.addLabelNode(labelGeneration)

        self.addChild(labelGeneration)
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
