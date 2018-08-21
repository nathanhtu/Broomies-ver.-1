//
//  ViewController.swift
//  Roomies
//
//  Created by Nathan Tu on 8/8/18.
//  Copyright © 2018 Nathan Tu. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseUI

class LoginViewController: UIViewController {
    
    @IBAction func ForgotPasswordButtonPressed(_ sender: Any) {
        
        print("Button Pressed")
        self.performSegue(withIdentifier: "ForgotPasswordSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton = FBSDKLoginButton()
        let buttonText = NSAttributedString(string: "Log in with Facebook")
        loginButton.setAttributedTitle(buttonText, for: .normal)
        loginButton.center = view.center
        view.addSubview(loginButton)

    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

