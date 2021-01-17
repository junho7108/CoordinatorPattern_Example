//
//  BaseViewController.swift
//  CoordinatorPattern_Example
//
//  Created by 태우 on 2021/01/17.
//

import UIKit


class BaseViewController: UIViewController {
    
    // MARK: Properties
    
    lazy private(set) var className: String = {
        return type(of: self).description().components(separatedBy: ".").last ?? ""
    }()
    
    var delegate: CoordinatorFinishDelegate?
    
    
    // MARK: Initializing
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    deinit {
        delegate?.coordinatorDidFinish()
    }
    
    
    // MARK: Layout Constraints
    
    private(set) var didSetupConstraints = false
    
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        setupLayout()
        setupAttributes()
        setupLocalization()
        setData()
        setupBinding()
        self.view.setNeedsUpdateConstraints()
    }
    
    override func updateViewConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateViewConstraints()
    }
    
    func setupLayout() {
        // Override Layout
    }
    
    func setupConstraints() {
        // Override Constraints
    }
    
    func setupAttributes() {
        // Override Attributes
    }
    
    func setupLocalization() {
        // Override Localization
    }
    
    func setData() {
        // Override Set Data
    }
    
    func setupBinding() {
        // Override Binding
    }
    
}
