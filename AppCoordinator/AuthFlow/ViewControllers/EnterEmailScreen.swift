//
//  ViewController.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/4/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol EnterEmailScreenDelegate: class {
    func didEnterEmail(email: String)
}

class EnterEmailScreen: UIViewController {
    weak var delegate: EnterEmailScreenDelegate?
   

    @IBAction func nextDidTap(_ sender: UIButton) {
        delegate?.didEnterEmail(email: "test@test.com")
    }
    
}

