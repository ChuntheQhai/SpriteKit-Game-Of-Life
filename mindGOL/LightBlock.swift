//
//  LightBlock.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/2/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit


class LightBlock: SKSpriteNode {
    var livingNeighbours: Int = 0

    var isAlive = false {
        didSet {
            self.hidden = !isAlive
        }
    }
    
    init(imageNamed:String) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.userInteractionEnabled = true
        self.anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
   
}
