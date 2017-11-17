//
//  PlayerConfigurator.swift
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

extension PlayerViewController: PlayerPresenterOutput {
}

extension PlayerInteractor: PlayerViewControllerOutput {
}

extension PlayerPresenter: PlayerInteractorOutput {
}

class PlayerConfigurator
{
    // MARK: - Object lifecycle
    
    // MARK: - Configuration
    class func getController(player: Player) -> PlayerViewController {
        let viewController = PlayerViewController()
        let router = PlayerRouter()
        router.viewController = viewController
        
        let presenter = PlayerPresenter()
        presenter.output = viewController
        
        let interactor = PlayerInteractor()
        interactor.output = presenter
        
        viewController.output = interactor
        viewController.router = router
        return viewController
    }
}
