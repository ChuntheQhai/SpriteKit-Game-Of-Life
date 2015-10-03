//
//  Board.swift
//  SpriteKit-Game-Of-Life
//
//  Created by Khoo Chun Qhai on 10/3/15.
//  Copyright © 2015 ChunQhai. All rights reserved.
//

import Foundation
import SpriteKit

class Board: SKSpriteNode {
    
   init(imageNamed:String, position:CGPoint) {
        let texture = SKTexture(imageNamed: imageNamed)
        super.init(texture: texture, color: UIColor.clearColor(), size: texture.size())
        self.position = position
   }
    
   override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)
   }
    
    

   required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
    
    
}