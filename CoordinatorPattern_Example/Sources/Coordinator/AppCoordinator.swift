//
//  AppCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class AppCoordinator: NSObject, Coordinator {
    
    // MARK: Properties
    
    var delegate: CoordinatorFinishDelegate?
    
    let window: UIWindow
    
    var presenter: UINavigationController

    var childCoordinators: [Coordinator]
    
    var tabBarController: UITabBarController
    
    
    // MARK: Initializing
    
    init(window: UIWindow) {
        self.window = window
        
        let navigationController = UINavigationController()
        navigationController.setNavigationBarHidden(true, animated: true)
        self.presenter = navigationController
        
        self.childCoordinators = []
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        window.rootViewController = presenter
        
        let coordinator = MainTabBarCoordinator(presenter: presenter)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
        
        window.makeKeyAndVisible()
    }
    
}
