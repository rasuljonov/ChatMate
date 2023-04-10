//
//  LoginViewController.swift
//  ChatMate
//
//  Created by hrasuljonov on 13/03/23.
//


import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

      

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldLabel: UITextField!
    
    @IBOutlet weak var passwordTextFieldLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextFieldLabel.text, let password = passwordTextFieldLabel.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print(e)
                } else {
                    self.performSegue(withIdentifier: K.loginSegue, sender: self)
                }
            }
        }
    }
}

