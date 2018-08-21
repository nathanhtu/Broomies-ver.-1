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

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    var handle: AuthStateDidChangeListenerHandle?
    
    @IBAction func ForgotPasswordButtonPressed(_ sender: Any) {
        
        print("Button Pressed")
        self.performSegue(withIdentifier: "ForgotPasswordSegue", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // facebook login button
        let fbLoginButton = FBSDKLoginButton()
        fbLoginButton.delegate = self
        let fbText = NSAttributedString(string: "Log in with Facebook")
        fbLoginButton.setAttributedTitle(fbText, for: .normal)
        fbLoginButton.center = view.center
        view.addSubview(fbLoginButton)

    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("logout")
        
        //When you call the logOut, the user is logged out of your app. it will not logout you from your fb account. if you want to do so, go into the safari app, you can go Facebook.com and logout of your account.
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
    }
   
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        
        if let error = error {
            print(error.localizedDescription)
            return
        }
        
        // After a user signs in, we can get the access token for the signe-in user and exchange it for a Firebase credential
        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)

        Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                return
            }
            // User is signed in
            // ...
        }
    }
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        // handle user and error as necessary
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            //self.setTitleDisplay(user) can write these functions later
            //self.tableView.reloadData()
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        Auth.auth().removeStateDidChangeListener(handle!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

