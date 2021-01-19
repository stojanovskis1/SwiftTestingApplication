//
//  MainViewController.swift
//  SwiftTestingApplication
//
//  Created by Stefan Stojanovski on 23/12/2020.
//  Copyright © 2020 Stefan Stojanovski. All rights reserved.
//


import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    @IBOutlet weak var books_table_view: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillAppear(animated)
        
        books_table_view.delegate = self
        books_table_view.dataSource = self
        books_table_view.bounces = false
        books_table_view.register(UINib.init(nibName: "BooksCell", bundle: nil), forCellReuseIdentifier: "BooksCell")
    }
    
    // MARK - Table delegate
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:BooksCell = tableView.dequeueReusableCell(withIdentifier: "BooksCell", for: indexPath) as! BooksCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
}
