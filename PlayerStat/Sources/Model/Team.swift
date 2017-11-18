//
//  Team.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation

class Team {
    let id: String
    let name: String
    let code: String
    let shortName: String
    var players: [Player]
    
    init(dictionary: NSDictionary) {
        if let value = dictionary.object(forKey: "id") as? Double {
            self.id = String(format: "%.f", value)
        } else {
            self.id = ""
        }
        if let value = dictionary.object(forKey: "name") as? String {
            self.name = value
        } else {
            self.name = ""
        }
        if let value = dictionary.object(forKey: "code") as? String {
            self.code = value
        } else {
            self.code = ""
        }
        if let value = dictionary.object(forKey: "short_name") as? String {
            self.shortName = value
        } else {
            self.shortName = ""
        }
        
        self.players = [Player]()
        if let array = dictionary.object(forKey: "top_players") as? [NSDictionary] {
            array.forEach { dict in
                let player = Player(dictionary: dict)
                player.team = self
                self.players.append(player)
            }
        }        
    }
}
