//
//  AppDelegate.swift
//  AppCoordinator
//
//  Created by Igor Zhukov on 11/4/18.
//  Copyright © 2018 Igor Zhukov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private lazy var applicationCoordinator: ApplicationCoordinator = self.makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        window.rootViewController = UINavigationController()
        window.makeKeyAndVisible()
        
        applicationCoordinator.start()
        
        
        return true
    }

    func makeCoordinator() -> ApplicationCoordinator  {
        return ApplicationCoordinator(with: window!.rootViewController as? UINavigationController ?? UINavigationController())
    }


}

