//
//  HomeFirstScreen.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/6/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol HomeFirstScreenDelegate: class {
    func didFinishHomeFirstScreen()
}

class HomeFirstScreen: UIViewController {
    weak var delegate: HomeFirstScreenDelegate?
    
    
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        delegate?.didFinishHomeFirstScreen()
    }
    
    
}
