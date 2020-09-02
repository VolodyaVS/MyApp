//
//  WelcomeViewController.swift
//  MyApp
//
//  Created by Vladimir Stepanchikov on 01.09.2020.
//  Copyright © 2020 Vladimir Stepanchikov. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - IB Outlets
    @IBOutlet weak var welcomeLabel: UILabel!
    
    //MARK: - Public Properties
    var user: UserInfo!
    
    //MARK: - Private Properties
    private let primaryColor = UIColor(
        red: 210/255,
        green: 109/255,
        blue: 128/255,
        alpha: 1
    )
    
    private let secondaryColor = UIColor(
        red: 107/255,
        green: 148/255,
        blue: 230/255,
        alpha: 1
    )
    
    // MARK: - Overide methods
    override func viewDidLoad() {
        super.viewDidLoad()
        addVerticalGradientLayer(topColor: primaryColor, bottomColor: secondaryColor)
        welcomeLabel.text = "Welcome, \(user.login)!"
    }

}

// MARK: - Set background color
extension WelcomeViewController {

    func addVerticalGradientLayer(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        gradient.locations = [0.0, 1.0]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        view.layer.insertSublayer(gradient, at: 0)
    }
}
