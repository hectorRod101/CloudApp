//
//  RoundButton.swift
//  CloudSecureLogin
//
//  Created by Hector Rodriguez on 11/27/19.
//  Copyright © 2019 Hector Rodriguez. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
           didSet {
               layer.borderColor = borderColor?.cgColor
           }
       }

}
