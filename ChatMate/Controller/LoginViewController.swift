//
//  LoginViewController.swift
//  ChatMate
//
//  Created by hrasuljonov on 13/05/23.
//


import UIKit
import FirebaseCore 
import FirebaseFirestore
import FirebaseAuth

      

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldLabel: UITextField!
    
    @IBOutlet weak var passwordTextFieldLabel: UITextField!
    
    override func viewDidLoad() {
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = .blue
        super.viewDidLoad()
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailTextFieldLabel.text, !email.isEmpty else {
            showErrorMessage("Please enter your email")
            return
        }
        
        guard let password = passwordTextFieldLabel.text, !password.isEmpty else {
            showErrorMessage("Please enter you password")
            return
        }
        
        if let email = emailTextFieldLabel.text, let password = passwordTextFieldLabel.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    print("Error: \(e)")
                    let errorMessage = e.localizedDescription
                    // Show the error message to the user using an alert or label
                    let alert = UIAlertController(title: "Error", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                } else {
                    // Registration successful, navigate to the next screen (e.g., ChatViewController)
                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                }
            }
        }
        
        func showErrorMessage(_ message: String) {
            let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

