//
//  UpdateProfileCoordinator.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/9/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol UpdateProfileCoordinatorDelegate: class {
    func didUpdateProfile(coordinator: UpdateProfileCoordinator)
}

class UpdateProfileCoordinator: Coordinator {
    private var router: UINavigationController
    var childCoordinators: [Coordinator] = []
    
    weak var delegate: UpdateProfileCoordinatorDelegate?
    
    init(_ router: UINavigationController) {
        self.router = router
    }
    
    func start() {
        showSetName()
    }
    
    private func showSetName() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: SetNameScreen = sb.instantiateViewController(withIdentifier: "SetNameScreen") as! SetNameScreen
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
    
    private func showSetAvatar() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: SetAvatarScreen = sb.instantiateViewController(withIdentifier: "SetAvatarScreen") as! SetAvatarScreen
        vc.delegate = self
        router.present(vc, animated: true, completion: nil)
    }

}


extension UpdateProfileCoordinator: SetNameScreenDelegate {
    func didSetName() {
        showSetAvatar()
    }
}


extension UpdateProfileCoordinator: SetAvatarScreenDelegate {
    func didSetAvatar(with viewController: UIViewController) {
        viewController.dismiss(animated: false, completion: nil)
        delegate?.didUpdateProfile(coordinator: self)
    }
}
