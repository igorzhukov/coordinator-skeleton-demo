//
//  AuthSecondScreenViewController.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/4/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol EnterPasswordScreenDelegate: class {
    func didEnterPassword(_ password: String)
}

class EnterPasswordScreen: UIViewController {
    weak var delegate: EnterPasswordScreenDelegate?

    @IBAction func didTapNext(_ sender: UIButton) {
        delegate?.didEnterPassword("qwerty")
    }
    
}
