//
//  BaseViewController.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/14/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import MBProgressHUD
protocol ErrorPresenterInput {
    func presentError(error: String)
}

protocol ErrorPresenterOutput {
    func displayError(error: String)
}

class BaseViewController: UIViewController, ErrorPresenterOutput {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialize() { }
    func navigationTitle() -> String { return "" }
    
    func shouldShowNavigationBar() -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = self.navigationTitle()
        self.view.backgroundColor = .white
        self.configureSubviews()
        self.configureLayout()
        self.configureContent()
        self.configureStyle()
        self.configureActions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(!self.shouldShowNavigationBar(), animated: false)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showHUD() {
        MBProgressHUD.showAdded(to: self.view, animated: true)
    }
    
    func hideHUD() {
        MBProgressHUD.hide(for: self.view, animated: true)
    }
    
    func configureSubviews() { }
    func configureLayout() { }
    func configureContent() { }
    func configureStyle() { }
    func configureActions() { }
    
    func displayError(error: String) {
        self.hideHUD()
        let controller = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        controller.addAction(UIAlertAction(title: "Try again", style: .default, handler: { [weak self] _ in
            self?.tryAgainAction()
        }))
        controller.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { [weak self] _ in
            self?.cancelAction()
        }))
        self.present(controller, animated: true, completion: nil)
    }
    
    func tryAgainAction() {
        // TO BE OVERRIDE
    }
    
    func cancelAction() {
        
    }
}

