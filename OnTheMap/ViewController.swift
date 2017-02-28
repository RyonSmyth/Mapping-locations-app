//
//  ViewController.swift
//  OnTheMap
//
//  Created by Ryan Smith on 2/13/17.
//  Copyright © 2017 Ryan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessage: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessage.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginPressed(_ sender: AnyObject) {
        
        let username = "\(self.emailTextField.text!)"
        let password = "\(self.passwordTextField.text!)"
        
        
        if(username.isEmpty || password.isEmpty) {
           self.errorMessage.isHidden = false
        } else {
            
        UdacityClient.sessionID(username, password) { (success, error) in
            if success == true {
                performUIUpdatesOnMain {
                    self.errorMessage.isHidden = true
                    let controller = self.storyboard!.instantiateViewController(withIdentifier: "mapViewController")
                    self.present(controller, animated: true, completion: nil)
                }
            } else {
                performUIUpdatesOnMain {
                    self.errorMessage.isHidden = false
                }
            }
            }
        }
        
        
    
    }
    

}


