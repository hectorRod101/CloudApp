//
//  ViewController.swift
//  CloudSecureLogin
//
//  Created by Hector Rodriguez on 11/27/19.
//  Copyright © 2019 Hector Rodriguez. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    // E-Mail textfield
    @IBOutlet weak var EMail: UITextField!
    
    // Password textfield
    @IBOutlet weak var Password: UITextField!
    
    //@IBOutlet weak var LoginButton: RoundButton!
    @IBOutlet weak var validMessage: UILabel!
    
    //@IBOutlet weak var RegisterButton: RoundButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        EMail.clearButtonMode = UITextField.ViewMode.whileEditing
        Password.clearButtonMode = UITextField.ViewMode.whileEditing
        validMessage.isHidden = true
        
        
        let accountImage = UIImage(named:"account")
        addLeftImageTo(txtField: EMail, andImage: accountImage!)
        
        let passwordImage = UIImage(named:"lock")
        addLeftImageTo(txtField: Password, andImage: passwordImage!)
        
        
        // configure delegates
        configureTextFields()
        
        // tap user input of screen and return key
        configureTapGesture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addLeftImageTo(txtField: UITextField, andImage img: UIImage){
        let leftImageView = UIImageView(frame:CGRect(x: 0.0, y: 0.0, width: img.size.width, height: img.size.height))
        leftImageView.image = img
        txtField.leftView = leftImageView
        txtField.leftViewMode = .always
    }

    // function: takes user tap input and
    // configures keyboard to appear and disappear
    private func configureTapGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(ViewController.handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    // function: handles user input tap
    @objc func handleTap(){
        print("Handle tap was called")
        view.endEditing(true)
    }
    // configures textfield delegates
    private func configureTextFields(){
        EMail.delegate = self
        Password.delegate = self
    }
    
    // Button Login
    @IBAction func Login(_ sender: Any) {
//        guard let email = self.EMail.text, let password = self.Password.text else{
//
//            return
//        }
                signInUser(email: EMail.text!, password: Password.text!)
    }
    
    // Create User
    func CreateUser(){
    }
    
    // User Sign-In
    func signInUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {(user, Error)
            in
            if Error == nil{
                self.validMessage.isHidden = false
                self.validMessage.text = "Success Login"
                print("success login")
            } else if (Error?._code  == AuthErrorCode.userNotFound.rawValue){
                self.validMessage.isHidden = false
                self.validMessage.text = "Sorry, couldn't find your MyCloud Account"
            }
            else{
                print("Not a user")
                self.validMessage.isHidden = false
                self.validMessage.text = "Sorry, couldn't find your MyCloud Account"
                print(Error)
                print(Error?.localizedDescription)
            }
        }
    }
    
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

