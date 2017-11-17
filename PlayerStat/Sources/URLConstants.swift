//
//  URLConstants.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/14/17.
//  Copyright © 2017 haile. All rights reserved.
//

import Foundation

struct URL {
    static let MATCH_URL = "https://statsapi.foxsports.com.au/3.0/api/sports/league/matches/NRL20172101/topplayerstats.json;type=fantasy_points;type=tackles;type=runs;type=run_metres?limit=5&userkey=A00239D3-45F6-4A0A-810C-54A347F144C2"
    
    static let PLAYER_URL = "https://statsapi.foxsports.com.au/3.0/api/sports/league/series/1/seasons/115/teams/%@/players/%@/detailedstats.json?&userkey=9024ec15-d791-4bfd-aa3b-5bcf5d36da4f"
    
    static let PLAYER_AVATAR_URL = "http://media.foxsports.com.au/match-centre/includes/images/headshots/landscape/nrl/%@.jpg"
}
