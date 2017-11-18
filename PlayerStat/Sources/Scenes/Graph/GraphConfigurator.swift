//
//  GraphConfigurator.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/19/17.
//  Copyright (c) 2017 haile. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension GraphViewController: GraphPresenterOutput {
    
}

extension GraphInteractor: GraphViewControllerOutput {
}

extension GraphPresenter: GraphInteractorOutput {
}

class GraphConfiguratorConfigurator {
    // MARK: - Object lifecycle
    
    static let sharedInstance = GraphConfiguratorConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func getController(matches: [Match]) -> GraphViewController {
        let viewController = GraphViewController(matches: matches)
        let router = GraphRouter()
        router.viewController = viewController
        
        let presenter = GraphPresenter()
        presenter.output = viewController
        
        let interactor = GraphInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
        return viewController
    }
}