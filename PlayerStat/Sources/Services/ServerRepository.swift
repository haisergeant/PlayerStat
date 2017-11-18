//
//  ServerRepository.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import Alamofire

class ServerRepository: Repository {
    static let instance = ServerRepository()
    func matchList() -> SignalProducer<[Match], NSError> {
        return SignalProducer { observer, disposable in
            let request = Alamofire.request(URL.MATCH_URL).responseJSON { response in
                if let mainDict = response.result.value as? [NSDictionary] {
                    var matches = [Match]()
                    mainDict.forEach {
                        matches.append(Match(dictionary: $0))
                    }
                    observer.send(value: matches)
                    observer.sendCompleted()
                }
            }
            _ = disposable.observeEnded {
                request.cancel()
            }
        }
    }
    
    func player(teamId: String, playerId: String) -> SignalProducer<PlayerDetail, NSError> {
        return SignalProducer { observer, disposable in
            let url = String(format: URL.PLAYER_AVATAR_URL, teamId, playerId)
            let request = Alamofire.request(url).responseJSON { response in
                if let mainDict = response.result.value as? NSDictionary {
                    let object = PlayerDetail(dictionary: mainDict)
                    observer.send(value: object)
                    observer.sendCompleted()
                }
            }
            _ = disposable.observeEnded {
                request.cancel()
            }
        }
    }
}
