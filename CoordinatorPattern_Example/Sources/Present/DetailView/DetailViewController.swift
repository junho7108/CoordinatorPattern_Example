//
//  DetailViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class DetailViewController: BaseViewController, Storyboard, CoordinatorContext {

    weak var coordinator: DetailCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

