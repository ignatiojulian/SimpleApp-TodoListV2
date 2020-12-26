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
        
        let alertError = UIAlertController(title: "Error", message: "Something Went Wrong", preferredStyle: UIAlertController.Style.alert)
        alertError.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        if(emailTextField.text == nil || emailTextField.text == "" && passwordTextField.text == nil || passwordTextField.text == "" ){
            self.present(alertError, animated: true, completion: nil)
        } else {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard let strongSelf = self else { return }
                if(error != nil){
                    strongSelf.statusLabel.text = "Ups! 😟"
                    strongSelf.statusLabel.textColor = .red
                    
                    return
                }
                strongSelf.statusLabel.text = "Enjoy 🥳"
                strongSelf.statusLabel.textColor = .blue
                
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabbarvc")
                vc.modalPresentationStyle = .overFullScreen
                self?.present(vc, animated: true, completion: nil)
            }
            
        }
    }
}
