//
//  Repository.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift

protocol Repository {
    func matchList() -> SignalProducer<[Match], NSError>
    func player(teamId: String, playerId: String) -> SignalProducer<PlayerDetail, NSError>
}
