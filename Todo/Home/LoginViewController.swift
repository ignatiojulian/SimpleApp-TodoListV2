//
//  LoginViewController.swift
//  Todo
//
//  Created by Ignatio Julian on 12/25/20.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        //
    }
    
    @IBAction func login(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          guard let strongSelf = self else { return }
            if(error != nil){
                strongSelf.statusLabel.text = "Ups! 😟"
                strongSelf.statusLabel.textColor = .red
        
                return
            }
            strongSelf.statusLabel.text = "Enjoy 🥳"
            strongSelf.statusLabel.textColor = .blue
        }
        
    }
    
}
