//
//  UIButton+extension.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 12/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func orangeRoundedCornersWithShaddow() {
        // 1. rounded corners
        self.layer.cornerRadius = 10.0

        // 2. Default Colors for state
        self.backgroundColor = .orange
        self.setTitleColor(.white, for: .normal)
        

        // 3. Add the shadow
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 6.0
        self.layer.masksToBounds = false
        
        // 4. add padding
        self.contentEdgeInsets = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
        
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.lightGray : UIColor.orange
        }
    }
    
}
