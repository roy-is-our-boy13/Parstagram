//
//  LoginViewController.swift
//  Parstagram
//
//  Created by Roy Perlman on 3/17/20.
//  Copyright © 2020 Roy Perlman. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController
{
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    @IBAction func onSignIn(_ sender: Any)
    {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        {
            (user,error) in
            if user != nil
            {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    @IBAction func onSignUp(_ sender: Any)
    {
        var user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        
        user.signUpInBackground
            {
                (success, error) in
            if success 
            {
                self.performSegue(withIdentifier: "loginSeque", sender: nil)
            }
            else
            {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
}
