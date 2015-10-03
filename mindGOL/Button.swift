//
//  StartButton.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit


class Button: SKSpriteNode {
    
    var grid: Grid!

    var isStartBtnPressed = false
    var isPauseBtnPressed = false
    
    var labelGeneration: Label!
    var labelPopulation: Label!

    init(name:String, size:CGSize, position:CGPoint, imageNamed:String){
        let buttonTexture = SKTexture(imageNamed: imageNamed)
        super.init(texture: buttonTexture, color: UIColor.clearColor(), size: size)
        self.name = name
        self.position = position
        self.userInteractionEnabled = true
        
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //
    //  General Functions
    //
    
    func nextMove() {
        check()
    }
    
    func exitSimulation() {
        exit(0)
    }
    
    func check() {
        GridHelper.getGrid().performStep()
        LabelHelper.getLabelNodeWithGroupName("lblGeneration").text = "\(GridHelper.getGrid().generation)"
        LabelHelper.getLabelNodeWithGroupName("lblPopulation").text = "\(GridHelper.getGrid().totalAlive)"
    }
    
    
    
    
    
    //
    //  Delegate functions
    //
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches
        let location = touch.first!.locationInNode(self)
        let node = self.nodeAtPoint(location)
        
        
        if (node.name == nameNextBtn && isStartBtnPressed == false) {
            self.texture = SKTexture(imageNamed: "assets/next-pressed.png")
            isStartBtnPressed = true
            nextMove()
        }
        
        if (node.name == nameExitBtn && isPauseBtnPressed == false) {
            self.texture = SKTexture(imageNamed: "assets/exit-pressed.png")
            isPauseBtnPressed = true
            exitSimulation()
        }

    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if(isStartBtnPressed) {
            isStartBtnPressed = !isStartBtnPressed
            self.texture = SKTexture(imageNamed: "assets/next.png")
        }
        
        if(isPauseBtnPressed) {
            isPauseBtnPressed = !isPauseBtnPressed
            self.texture = SKTexture(imageNamed: "assets/exit.png")
        }
    }
    
    
    
    
}
