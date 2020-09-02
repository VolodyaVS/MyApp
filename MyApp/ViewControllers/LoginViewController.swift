//
//  ViewController.swift
//  MyApp
//
//  Created by Vladimir Stepanchikov on 29.08.2020.
//  Copyright © 2020 Vladimir Stepanchikov. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    // MARK: - Private properties
    private let user = UserInfo.getUserData()
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let tabBarController = segue.destination as! UITabBarController
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        let navigationVC = tabBarController.viewControllers?.last as! UINavigationController
        let aboutUserVC = navigationVC.topViewController as! AboutMeViewController
        
        welcomeVC.user = user
        aboutUserVC.user = user
        
    }
    
    // MARK: IBActions
    @IBAction func LogInAction() {
        guard
            userName.text == user.login,
            userPassword.text == user.password
            else {
                showAlert(title: "Oooops",
                          message: "Please, enter correct login and password!",
                          textField: userPassword)
                return
        }
        performSegue(withIdentifier: "logIn", sender: nil)
    }
    
    @IBAction func forgotNameAction() {
        showAlert(title: "Oooops",
                  message: "Your name is \(user.login) 😜")
    }
    
    @IBAction func forgotPassword() {
        showAlert(title: "Oooops",
                  message: "Ты ещё и пароль забыл😛 Попробуй ввести \(user.password) 😜")
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
        userName.text = nil
        userPassword.text = nil
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = nil
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}

// MARK: Text Field Delegate
extension LoginViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userName {
            print("")
            textField.resignFirstResponder()
            userPassword.becomeFirstResponder()
        } else {
            LogInAction()
        }
        return true
    }
    
}


