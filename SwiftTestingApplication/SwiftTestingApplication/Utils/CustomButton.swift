//
//  CustomButton.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 12/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import Foundation
import UIKit

class CustomButton : UIButton {
    
    var highlitedColor : UIColor?
    var normalColor : UIColor?
    
    func orangeRoundedCornersWithShaddow() {
        self.highlitedColor = .systemOrange
        self.normalColor = UIColor.orange
        self.backgroundColor = .orange
        self.setTitleColor(.white, for: .normal)
        
        addRoundedCorners(r: 10.0)
        addShaddow()
        addPadding(padding:15.0)
    }
    
    
    func purpleRoundedCornersWithShaddow() {
        self.highlitedColor = UIColor(red: 0.60, green: 0.16, blue: 0.60, alpha: 1.00)
        self.normalColor = UIColor.purple
        self.backgroundColor = .purple
        self.setTitleColor(.white, for: .normal)
        
        addRoundedCorners(r: 10.0)
        addShaddow()
        addPadding(padding:15.0)  
    }
    
    func addRoundedCorners(r:CGFloat){
        self.layer.cornerRadius = r
    }
    
    func addPadding(padding:CGFloat){
        self.contentEdgeInsets = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
    
    func addShaddow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 6.0
        self.layer.masksToBounds = false
    }
    
    override open var isHighlighted: Bool {
        didSet {
            
            if let normal = normalColor, let highlight = highlitedColor {
                backgroundColor = isHighlighted ? highlight: normal
            }
            
        }
    }
    
}
