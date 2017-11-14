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
    let teamA: Team
    let teamB: Team
    let statType: String
    
    init(dictionary: NSDictionary) {
        if let value = dictionary.object(forKey: "match_id") as? String {
            self.id = value
        } else {
            self.id = ""
        }
        
    }
}
