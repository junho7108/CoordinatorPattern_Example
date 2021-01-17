//
//  DetailCoordinator.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class DetailCoordinator: NSObject, Coordinator {
    
    // MARK: Properties
    
    var delegate: CoordinatorFinishDelegate?
    
    var presenter: UINavigationController
    
    var childCoordinators: [Coordinator]
    
    
    // MARK: Initializing
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.childCoordinators = []
    }
    
    func start() {
        let detailView = DetailViewController.instantiate()
        detailView.coordinator = self
        presenter.pushViewController(detailView, animated: true)
    }
    
}

