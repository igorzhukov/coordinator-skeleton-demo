//
//  ChangeAvatarScreen.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/9/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol SetAvatarScreenDelegate: class {
    func didSetAvatar(with viewController: UIViewController)
}

class SetAvatarScreen: UIViewController {
    weak var delegate: SetAvatarScreenDelegate?
    
    
 
    @IBAction func actionButtonDidTap(_ sender: UIButton) {
        delegate?.didSetAvatar(with: self)
    }
    
}
