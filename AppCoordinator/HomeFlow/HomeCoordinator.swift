//
//  HomeCoordinator.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/6/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

class HomeCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    private var router: UINavigationController
    
    init(_ router: UINavigationController) {
        self.router = router
    }
    
    func start() {
        showHomeFirst()
    }
    
    func showHomeFirst() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: HomeFirstScreen = sb.instantiateViewController(withIdentifier: "HomeFirstScreen") as! HomeFirstScreen
        vc.delegate = self
        router.setViewControllers([vc], animated: true)
    }
    
    func showHomeSecond() {
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc: HomeSecondScreen = sb.instantiateViewController(withIdentifier: "HomeSecondScreen") as! HomeSecondScreen
        router.pushViewController(vc, animated: true)
    }
}

extension HomeCoordinator: HomeFirstScreenDelegate {
    func didFinishHomeFirstScreen() {
        showHomeSecond()
    }
}
