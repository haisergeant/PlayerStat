//
//  PlayerInteractor.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright (c) 2017 haile. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit
import ReactiveSwift
import ReactiveCocoa

protocol PlayerInteractorInput {
    func load(request: PlayerRequest)
}

protocol PlayerInteractorOutput: ErrorPresenterInput {
    func present(response: PlayerResponse)
}

class PlayerInteractor: PlayerInteractorInput {
    var output: PlayerInteractorOutput!
    var repository: Repository!
    
    // MARK: - Business logic
    func load(request: PlayerRequest) {
        let player = request.player
        if let team = player.team {
            self.repository.player(teamId: team.id, playerId: player.id)
                .startWithResult { [weak self] result in
                    if let value = result.value {
                        self?.output.present(response: PlayerResponse(playerDetail: value))
                    } else {
                        self?.output.presentError(error: "Cannot call service")
                    }
                }
        }
    }
}
