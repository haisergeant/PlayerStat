//
//  Player.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/15/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation

class Player {
    let id: String
    let position: String
    let fullName: String
    let shortName: String
    let statValue: Double
    let jumperNumber: Int
    
    init(dictionary: NSDictionary) {
        if let value = dictionary.object(forKey: "id") as? String {
            self.id = value
        } else {
            self.id = ""
        }
        if let value = dictionary.object(forKey: "position") as? String {
            self.position = value
        } else {
            self.position = ""
        }
        if let value = dictionary.object(forKey: "full_name") as? String {
            self.fullName = value
        } else {
            self.fullName = ""
        }
        if let value = dictionary.object(forKey: "short_name") as? String {
            self.shortName = value
        } else {
            self.shortName = ""
        }
        if let value = dictionary.object(forKey: "stat_value") as? Double {
            self.statValue = value
        } else {
            self.statValue = 0.0
        }
        if let value = dictionary.object(forKey: "jumper_number") as? Int {
            self.jumperNumber = value
        } else {
            self.jumperNumber = 0
        }
    }
}
