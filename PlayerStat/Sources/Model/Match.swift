//
//  Match.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation

class Match {
    let id: String
    var teamA: Team? = nil
    var teamB: Team? = nil
    let statType: String
    
    init(dictionary: NSDictionary) {
        if let value = dictionary.object(forKey: "match_id") as? String {
            self.id = value
        } else {
            self.id = ""
        }
        
        if let value = dictionary.object(forKey: "team_A") as? NSDictionary {
            self.teamA = Team(dictionary: value)
        }
        
        if let value = dictionary.object(forKey: "team_B") as? NSDictionary {
            self.teamB = Team(dictionary: value)
        }
        
        if let value = dictionary.object(forKey: "stat_type") as? String {
            self.statType = value
        } else {
            self.statType = ""
        }
    }
}
