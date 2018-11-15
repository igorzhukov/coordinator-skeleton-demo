//
//  AuthCoordinator.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/6/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol AuthCoordinatorDelegate: class {
    func didAuthintificate(coordinator: AuthCoordinator)

}

class AuthCoordinator: Coordinator {
    weak var delegate: AuthCoordinatorDelegate?
    
    var childCoordinators: [Coordinator] = []
    private var router: UINavigationController
    
    // MARK: play with value to change flow
    private let mustUpdateProfile = true
    
    init(_ router: UINavigationController) {
        self.router = router
    }
    
    func start() {
        showInputEmail()
    }
    
    private func showInputEmail() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: EnterEmailScreen = sb.instantiateViewController(withIdentifier: "AuthEmailScreen") as! EnterEmailScreen
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
    
    private func showInputPassword() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: EnterPasswordScreen = sb.instantiateViewController(withIdentifier: "AuthPasswordScreen") as! EnterPasswordScreen
        vc.delegate = self
        router.pushViewController(vc, animated: true)
    }
    
    private func runUpdateProfileFlow() {
        let updateProfileCoordinator = UpdateProfileCoordinator(router)
        updateProfileCoordinator.delegate = self
        updateProfileCoordinator.start()
        childCoordinators.append(updateProfileCoordinator)
    }
    
    private func remove(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter {
            $0 !== coordinator
        }
    }
}

extension AuthCoordinator: EnterEmailScreenDelegate {
    func didEnterEmail(email: String) {
        showInputPassword()
    }
    
    
}

extension AuthCoordinator: EnterPasswordScreenDelegate {
    func didEnterPassword(_ password: String) {
        if mustUpdateProfile {
                runUpdateProfileFlow()
        } else {
             delegate?.didAuthintificate(coordinator: self)
        }
        
    }
}

extension AuthCoordinator: UpdateProfileCoordinatorDelegate {
    func didUpdateProfile(coordinator: UpdateProfileCoordinator) {
        remove(coordinator: coordinator)
        delegate?.didAuthintificate(coordinator: self)
    }
}
