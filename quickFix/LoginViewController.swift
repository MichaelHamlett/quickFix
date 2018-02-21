//
//  LoginViewController.swift
//  quickFix
//
//  Created by Michael Hamlett, Akshay Trikha, Pratyush Kapur on 10/28/17.
//  Copyright © 2017 Michael Hamlett, Akshay Trikha, Pratyush Kapur, Shiv Seetharaman, Maxwell Maleno. All rights reserved.


import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var userField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        FIRAuth.auth()?.signIn(withEmail: userField.text!, password: passField.text!, completion: { (user, error) in
            if error == nil{
                print ("success")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
        })
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
