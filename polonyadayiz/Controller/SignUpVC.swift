//
//  SignUpVC.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 8.09.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit
import SVProgressHUD
import FirebaseAuth

class SignUpVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }

    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        
        SVProgressHUD.show(withStatus: "Creating")
        
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            } else {
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "toHomeVC", sender: self)
            }
        }
        
    }
    
    @objc func closeKeyboard() {
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
    }
    
    
   

}
