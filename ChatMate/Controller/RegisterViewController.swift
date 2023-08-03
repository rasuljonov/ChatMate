//
//  RegisterViewController.swift
//  ChatMate
//
//  Created by hrasuljonov on 11/03/23.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = .purple
        navigationController?.navigationBar.tintColor = .blue
    }
    
    @IBAction func registerPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty else {
            showErrorMessage("Please write your email")
            return
        }
        
        guard let password = passwordTextField.text, !password.isEmpty else {
            showErrorMessage("Please create a password")
            return
        }
        
        // Proceed with authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
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
