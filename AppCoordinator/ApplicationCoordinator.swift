//
//  AppFlowCoordinator.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/4/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
}

class ApplicationCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private var router: UINavigationController
    
    init(with router: UINavigationController) {
        self.router = router
    }
    
    // MARK: play with value to change flow
    var isAuthentificated = false
    
    func start() {
        if !isAuthentificated {
            runAuthFlow()
        } else {
            runHomeFlow()
        }
        
    }
    
    private func runAuthFlow() {
        let authCoordinator = AuthCoordinator(router)
        authCoordinator.delegate = self
        childCoordinators.append(authCoordinator)
        authCoordinator.start()
    }
    
    private func runHomeFlow() {
        let homeCordinator = HomeCoordinator(router)
        childCoordinators.append(homeCordinator)
        homeCordinator.start()
    }
    
    private func remove(coordinator: Coordinator) {
        childCoordinators = childCoordinators.filter {
            $0 !== coordinator
        }
    }
}

extension ApplicationCoordinator: AuthCoordinatorDelegate {
    func didAuthintificate(coordinator: AuthCoordinator) {
        runHomeFlow()
        remove(coordinator: coordinator)
    }
}
