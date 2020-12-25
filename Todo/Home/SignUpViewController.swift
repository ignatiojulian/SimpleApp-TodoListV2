//
//  SignUpViewController.swift
//  Todo
//
//  Created by Ignatio Julian on 12/25/20.
//

import UIKit
import Firebase


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var toLoginButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().currentUser?.isEmailVerified
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        
        let alertError = UIAlertController(title: "Error", message: "Something Went Wrong", preferredStyle: UIAlertController.Style.alert)
        alertError.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
//        let alertSuccess = UIAlertController(title: "Succes", message: "Yeay! Congratulation your account has been created! 🥳", preferredStyle: UIAlertController.Style.alert)
//        alertSuccess.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        
        if(nameTextField.text == nil || nameTextField.text == "" && emailTextField.text == nil || emailTextField.text == "" && passwordTextField.text == nil || passwordTextField.text == "" ){
            self.present(alertError, animated: true, completion: nil)
        } else {
            let email = emailTextField.text!
            let password = passwordTextField.text!
            
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if(error != nil) {
                    return
                }
            }
            print("SUCCESS SIGNUP")
            
        }
        dismiss(animated: true, completion: nil)
    }

}
