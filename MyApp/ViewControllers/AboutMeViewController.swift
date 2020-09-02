//
//  AboutMeViewController.swift
//  MyApp
//
//  Created by Vladimir Stepanchikov on 01.09.2020.
//  Copyright © 2020 Vladimir Stepanchikov. All rights reserved.
//

import UIKit

class AboutMeViewController: UIViewController {
    
    var user: UserInfo!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = user.login
    }
    
}
