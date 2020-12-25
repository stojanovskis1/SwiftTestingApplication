//
//  MainViewController.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 23/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//


import UIKit

class MainViewController: UIViewController {
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
    }
}
