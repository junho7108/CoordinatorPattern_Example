//
//  Storyboard.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


@objc
protocol Storyboard {
    @objc optional static func instantiate() -> Self
}


extension Storyboard where Self: UIViewController {
    
    static func instantiate(from name: String = "Main") -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".").last ?? ""
        let storyboard = UIStoryboard(name: name, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
    
}
