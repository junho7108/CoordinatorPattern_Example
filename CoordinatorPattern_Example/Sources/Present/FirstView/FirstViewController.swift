//
//  FirstViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit

class FirstViewController: BaseViewController, Storyboard, CoordinatorContext {

    weak var coordinator: FirstCoordinator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    @IBAction func goDetailView(_ sender: UIButton) {
        coordinator?.pushToDetail()
    }

}

