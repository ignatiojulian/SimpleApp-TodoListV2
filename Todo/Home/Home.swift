//
//  ViewController.swift
//  Todo
//
//  Created by Ignatio Julian on 12/22/20.
//

import UIKit
import FirebaseDatabase
import Firebase



class Home: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var navbarView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var titleNavbar: UILabel!
    
    let ref = Database.database().reference(withPath: "notes-items")

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        self.titleNavbar.text = "Home"
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
        ref.observeSingleEvent(of: .value, with: { snapshoot in
        
//              self.tableView.reloadData()
        })
//        // 2
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! Cells
        cell.backgroundColor = UIColor.white
        cell.label.text = "Test \(indexPath.row+5)"

        print("You selected cell #\(indexPath.row)!")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func alertAddActivity(_ sender: Any) {
        let alertAddItems = UIAlertController(title: "New Notes", message: "Add an notes", preferredStyle: UIAlertController.Style.alert)
        
        alertAddItems.addTextField(configurationHandler: { textField in
            textField.placeholder = "Your new notes"
            
            let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
                print("Ok button tapped")
                let notesItem = textField.text
                
                let data = self.ref.child(notesItem?.lowercased() ?? "-")
                data.setValue(notesItem)
            })
           
            let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
                print("Cancel button tapped")
            }
            
            alertAddItems.addAction(ok)
            alertAddItems.addAction(cancel)
        })
        self.present(alertAddItems, animated: true, completion: nil)
    }
    
}


