//
//  String+extension.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 12/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//

import Foundation

extension String {
    func isValidEmail() -> Bool {
       do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count)) != nil
        } catch {
            return false
        }
    }
    
    func isValidPassword() -> Bool {
          do {
            let regexInclude = try NSRegularExpression(pattern: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[A-Za-z\\d]{8,}")
                 return regexInclude.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.count)) != nil
            
           } catch {
               return false
           }
       }
}
