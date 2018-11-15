//
//  ChangeNameScreen.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/9/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol SetNameScreenDelegate: class {
    func didSetName()
}

class SetNameScreen: UIViewController {
    weak var delegate: SetNameScreenDelegate?
    
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        delegate?.didSetName()
    }
    
}
