//
//  SignInVC.swift
//  polonyadayiz
//
//  Created by Emir Kartal on 8.09.2018.
//  Copyright © 2018 Emir Kartal. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

class SignInVC: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var ds: DataService = DataService.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        ds.loadUniversities()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func signInBtnTapped(_ sender: UIButton) {
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (result, error) in
            if error != nil {
                SVProgressHUD.showError(withStatus: error?.localizedDescription)
            }else {
                SVProgressHUD.showSuccess(withStatus: "Successfull")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "toHomeVC", sender: self)
            }
        }
        
    }
    @IBAction func signUpBtnTapped(_ sender: UIButton) {
        
        performSegue(withIdentifier: "toSignUpVC", sender: nil)
        
    }
    
    @objc func closeKeyboard() {
        
        emailTextField.endEditing(true)
        passwordTextField.endEditing(true)
        
    }
    
}
