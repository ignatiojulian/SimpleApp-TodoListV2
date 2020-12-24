//
//  ViewController.swift
//  Todo
//
//  Created by Ignatio Julian on 12/22/20.
//

import UIKit

class Home: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var NavBar: NavigationBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        NavBar.title = "Todoey | Home"
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(Cells.self, forCellReuseIdentifier: "cellId")
        
        view.addSubview(tableView)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 2
        //        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cells
        //        cell.backgroundColor = UIColor.black
        //        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cells
        cell.backgroundColor = UIColor.white
        cell.label.text = "Day \(indexPath.row+5)"
        
        print("You selected cell #\(indexPath.row)!")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}


