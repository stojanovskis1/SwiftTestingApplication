//
//  UILabel+extension.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 12/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func setupAsErrorMessage(){
        self.textColor = .red
        self.font = self.font.withSize(12)
        self.numberOfLines = 10
        self.textAlignment = .center
    }
    
    func setupAsHintDescription(){
        self.textColor = .gray
        self.font = self.font.withSize(12)
    }
}
