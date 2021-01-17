//
//  MainTabBarCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class MainTabBarCoordinator: NSObject, Coordinator {
    
    enum TabBarItem: CaseIterable {
        case first
        case second
        
        var title: String {
            switch self {
            case .first: return "First"
            case .second: return "Second"
            }
        }
        
        func getCoordinator(presenter: UINavigationController) -> Coordinator {
            switch self {
            case .first: return FirstCoordinator(presenter: presenter)
            case .second: return SecondCoordinator(presenter: presenter)
            }
        }
    }
    
    // MARK: Properties
    
    var delegate: CoordinatorFinishDelegate?
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    var tabBarController: UITabBarController
    
    var tabBarItems: [TabBarItem] = [ .first, .second]
    
    
    // MARK: Initializing
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
        self.tabBarController = UITabBarController()
    }
    
    func start() {
        let controllers = tabBarItems.map { getTabController(item: $0) }
        prepareTabBarController(withTabControllers: controllers)
    }
    
    func getTabController(item: TabBarItem) -> UINavigationController {
        let navigationController = UINavigationController()
        let tabItem = UITabBarItem(title: item.title, image: nil, selectedImage: nil)
        navigationController.tabBarItem = tabItem
        
        let coordinator = item.getCoordinator(presenter: navigationController)
        coordinator.delegate = self
        childCoordinators.append(coordinator)
        coordinator.start()
        
        return navigationController
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: true)
        tabBarController.selectedIndex = 0
        tabBarController.tabBar.isTranslucent = false
        presenter.viewControllers = [tabBarController]
    }

}

