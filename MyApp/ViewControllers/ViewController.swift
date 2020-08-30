//
//  ViewController.swift
//  MyApp
//
//  Created by Vladimir Stepanchikov on 29.08.2020.
//  Copyright © 2020 Vladimir Stepanchikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, with: event) }
    
    @IBAction func LogInAction(_ sender: Any) {
        if let _ = userName.text?.isEmpty {
            if let _ = userPassword.text?.isEmpty {
                let alertEmpty = UIAlertController(
                    title: "Oooops",
                    message: "Необходимо ввести логин и пароль!",
                    preferredStyle: .alert
                )
                
                alertEmpty.addAction(UIAlertAction(
                    title: NSLocalizedString("OK",
                    comment: "Default action"),
                    style: .default,
                    handler: { _ in NSLog("The \"OK\" alert occured.")
                }))
                self.present(alertEmpty, animated: true, completion: nil)
            } else { return }
            
        } else { return }
        
    }
    
    @IBAction func forgotNameAction(_ sender: Any) {
        let alertName = UIAlertController(
            title: "Oooops",
            message: "Ты видимо забыл логин?😛 Попробуй ввести Iamfish",
            preferredStyle: .alert
        )
        
        alertName.addAction(UIAlertAction(
            title: NSLocalizedString("OK",
            comment: "Default action"),
            style: .default,
            handler: { _ in NSLog("The \"OK\" alert occured.")
        }))
        self.present(alertName, animated: true, completion: nil)
    }
    
    @IBAction func forgotPassword(_ sender: Any) {
        let alertPassword = UIAlertController(
            title: "Oooops",
            message: "Ты ещё и пароль забыл😛 Попробуй ввести tutifrutti",
            preferredStyle: .alert
        )
        
        alertPassword.addAction(UIAlertAction(
            title: NSLocalizedString("OK",
            comment: "Default action"),
            style: .default,
            handler: { _ in NSLog("The \"OK\" alert occured.")
        }))
        self.present(alertPassword, animated: true, completion: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    }
}

