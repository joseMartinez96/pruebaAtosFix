//
//  buttonBlue.swift
//  pruebaAtos
//
//  Created by IOS_002 on 08/04/22.
//

import Foundation
import UIKit


class buttonBlue: UIButton{
    @IBInspectable var cornerRadius: CGFloat = 4
    @IBInspectable var uColor: UIColor? = UIColor.convertToRGB("3f83a1")
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setup()
    }
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    func setup(){
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = tintColor.cgColor
        
        self.setTitleColor(.white, for: .normal)
        self.backgroundColor = uColor
        self.setNeedsDisplay()
    }
    
}
