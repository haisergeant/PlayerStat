//
//  Match.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright (c) 2017 haile. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

// MARK: - Connect View, Interactor, and Presenter

extension MatchViewController: MatchPresenterOutput {
    
}

extension MatchInteractor: MatchViewControllerOutput {
}

extension MatchPresenter: MatchInteractorOutput {
}

class MatchConfigurator {
    // MARK: - Object lifecycle
    static let sharedInstance = MatchConfigurator()
    private init() {}
    
    // MARK: - Configuration
    func getController() -> MatchViewController {
        let viewController = MatchViewController()
        
        let router = MatchRouter()
        router.viewController = viewController
        
        let presenter = MatchPresenter()
        presenter.output = viewController
        
        let interactor = MatchInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
        
        return viewController
    }
}
