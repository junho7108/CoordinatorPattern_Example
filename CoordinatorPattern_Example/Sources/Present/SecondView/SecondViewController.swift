//
//  SecondViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class SecondViewController: BaseViewController, Storyboard, CoordinatorContext {

    weak var coordinator: SecondCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

