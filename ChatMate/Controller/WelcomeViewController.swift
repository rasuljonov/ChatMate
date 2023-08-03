//
//  WelcomeViewController.swift
//  ChatMate
//
//  Created by hrasuljonov on 11/03/23.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: CLTypingLabel!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        titleLabel.text = K.appName
        
      
    }
}



