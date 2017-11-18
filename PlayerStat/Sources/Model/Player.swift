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
    var team: Team!
    
    init(dictionary: NSDictionary) {
        if let value = dictionary.object(forKey: "id") as? Double {
            self.id = String(format: "%.f", value)
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


class PlayerDetail {
    var player: Player
    let surname: String?
    let otherName: String?
    
    let birthDate: Date?
    let height: Double?
    let weight: Double?
    
    let games: Int?
    let points: Int?
    let tries: Int?
    let winPercentage: Double?
    
    // last match stats
    var error: Double? = nil
    var goals: Double? = nil
    var intercepted: Double? = nil
    var intercepts: Double? = nil
    var kicks: Double? = nil
    var matchPoints: Double? = nil
    var possessions: Double? = nil
    var runs: Double? = nil
    var tackles: Double? = nil
    var matchTries: Double? = nil
    var minsPlayed: Double? = nil
    var attackingKicks: Double? = nil
    var bombCaught: Double? = nil
    var bombDropped: Double? = nil
    var chargedDown: Double? = nil
    var chargesDown: Double? = nil
    var dropOuts: Double? = nil
    var dummyHalfRuns: Double? = nil
    var effectiveOffloads: Double? = nil
    var fantasyPoints: Double? = nil
    var fieldGoalAttemps: Double? = nil
    var fieldGoalMisses: Double? = nil
    var fieldGoals: Double? = nil
    var forcedDropOuts: Double? = nil
    var generalPlayPass: Double? = nil
    var goalMisses: Double? = nil
    var ineffectiveTackles: Double? = nil
    var inGoalEscapes: Double? = nil
    var interchangesOff: Double? = nil
    var interchangesOn: Double? = nil
    var kickErrors: Double? = nil
    var kickMetres: Double? = nil
    var kickReturnMetres: Double? = nil
    var kickReturns: Double? = nil
    var kicks4020: Double? = nil
    var kicksDead: Double? = nil
    var lastTouchTryAssists: Double? = nil
    var lineBreakAssists: Double? = nil
    var lineBreakCauses: Double? = nil
    var lineBreaks: Double? = nil
    var lineEngagements: Double? = nil
    var longKicks: Double? = nil
    var missedTackles: Double? = nil
    var offLoads: Double? = nil
    var onePassRuns: Double? = nil
    var penaltiesConceded: Double? = nil
    var playTheBalls: Double? = nil
    var runMetres: Double? = nil
    var runs7lessMeters: Double? = nil
    var runs8plusMeters: Double? = nil
    var sendOffs: Double? = nil
    var sinBins: Double? = nil
    var stealsOneOnOne: Double? = nil
    var stolenOneOnOne: Double? = nil
    var tackleBusts: Double? = nil
    var tackledOpp20: Double? = nil
    var tackleOppHalf: Double? = nil
    var tacklesOneOnOne: Double? = nil
    var tryAsists: Double? = nil
    var tryCauses: Double? = nil
    var tryContributionPercentage: Double? = nil
    var tryContributions: Double? = nil
    var tryInvolvements: Double? = nil
    var twentyMetreRestarts: Double? = nil
    var weightedKicks: Double? = nil
    
    init(dictionary: NSDictionary) {
        self.player = Player(dictionary: dictionary)
        self.surname = (dictionary.object(forKey: "surname") as? String) ?? ""
        self.otherName = (dictionary.object(forKey: "other_names") as? String) ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        self.birthDate = dateFormatter.date(from: ((dictionary.object(forKey: "date_of_birth") as? String) ?? ""))
        
        self.height = dictionary.object(forKey: "height_cm") as? Double
        self.weight = dictionary.object(forKey: "weight_kg") as? Double
        
        if let careerDict = dictionary.object(forKey: "career_stats") as? NSDictionary {
            self.games = careerDict.object(forKey: "games") as? Int
            self.points = careerDict.object(forKey: "points") as? Int
            self.tries = careerDict.object(forKey: "tries") as? Int
            self.winPercentage = careerDict.object(forKey: "win_percentage") as? Double
        } else {
            self.games = nil
            self.points = nil
            self.tries = nil
            self.winPercentage = nil
        }
        
        if let matchDict = dictionary.object(forKey: "last_match_stats") as? NSDictionary {
            self.error = matchDict.object(forKey: "errors") as? Double
            self.goals = matchDict.object(forKey: "goals") as? Double
            self.intercepted = matchDict.object(forKey: "intercepted") as? Double
            self.intercepts = matchDict.object(forKey: "intercepts") as? Double
            
            self.kicks = matchDict.object(forKey: "kicks") as? Double
            self.matchPoints = matchDict.object(forKey: "points") as? Double
            self.possessions = matchDict.object(forKey: "possessions") as? Double
            self.runs = matchDict.object(forKey: "runs") as? Double
            self.tackles = matchDict.object(forKey: "tackles") as? Double
            self.matchTries = matchDict.object(forKey: "tries") as? Double
            self.minsPlayed = matchDict.object(forKey: "mins_played") as? Double
            self.attackingKicks = matchDict.object(forKey: "attacking_kicks") as? Double
            self.bombCaught = matchDict.object(forKey: "bombs_caught") as? Double
            self.bombDropped = matchDict.object(forKey: "bombs_dropped") as? Double
            self.chargedDown = matchDict.object(forKey: "charged_down") as? Double
            self.chargesDown = matchDict.object(forKey: "charges_down") as? Double
            self.dropOuts = matchDict.object(forKey: "drop_outs") as? Double
            self.dummyHalfRuns = matchDict.object(forKey: "dummy_half_runs") as? Double
            self.effectiveOffloads = matchDict.object(forKey: "effective_offloads") as? Double
            self.fantasyPoints = matchDict.object(forKey: "fantasy_points") as? Double
            self.fieldGoalAttemps = matchDict.object(forKey: "field_goal_attempts") as? Double
            self.fieldGoalMisses = matchDict.object(forKey: "field_goal_misses") as? Double
            self.fieldGoals = matchDict.object(forKey: "field_goals") as? Double
            self.forcedDropOuts = matchDict.object(forKey: "forced_drop_outs") as? Double
            self.generalPlayPass = matchDict.object(forKey: "general_play_pass") as? Double
            self.goalMisses = matchDict.object(forKey: "goal_misses") as? Double
            self.ineffectiveTackles = matchDict.object(forKey: "ineffective_tackles") as? Double
            self.inGoalEscapes = matchDict.object(forKey: "in_goal_escapes") as? Double
            self.interchangesOff = matchDict.object(forKey: "interchanges_off") as? Double
            self.interchangesOn = matchDict.object(forKey: "interchanges_on") as? Double
            self.kickErrors = matchDict.object(forKey: "kick_errors") as? Double
            self.kickMetres = matchDict.object(forKey: "kick_metres") as? Double
            self.kickReturnMetres = matchDict.object(forKey: "kick_return_metres") as? Double
            self.kickReturns = matchDict.object(forKey: "kick_returns") as? Double
            self.kicks4020 = matchDict.object(forKey: "kicks_4020") as? Double
            self.kicksDead = matchDict.object(forKey: "kicks_dead") as? Double
            self.lastTouchTryAssists = matchDict.object(forKey: "last_touch_try_assists") as? Double
            self.lineBreakAssists = matchDict.object(forKey: "line_break_assists") as? Double
            self.lineBreakCauses = matchDict.object(forKey: "line_break_causes") as? Double
            self.lineBreaks = matchDict.object(forKey: "line_breaks") as? Double
            self.lineEngagements = matchDict.object(forKey: "line_engagements") as? Double
            self.longKicks = matchDict.object(forKey: "long_kicks") as? Double
            self.missedTackles = matchDict.object(forKey: "missed_tackles") as? Double
            self.offLoads = matchDict.object(forKey: "off_loads") as? Double
            self.onePassRuns = matchDict.object(forKey: "one_pass_runs") as? Double
            self.penaltiesConceded = matchDict.object(forKey: "penalties_conceded") as? Double
            self.playTheBalls = matchDict.object(forKey: "play_the_balls") as? Double
            self.runMetres = matchDict.object(forKey: "run_metres") as? Double
            self.runs7lessMeters = matchDict.object(forKey: "runs_7less_meters") as? Double
            self.runs8plusMeters = matchDict.object(forKey: "runs_8plus_meters") as? Double
            self.sendOffs = matchDict.object(forKey: "send_offs") as? Double
            self.sinBins = matchDict.object(forKey: "sin_bins") as? Double
            self.stealsOneOnOne = matchDict.object(forKey: "steals_one_on_one") as? Double
            self.stolenOneOnOne = matchDict.object(forKey: "stolen_one_on_one") as? Double
            self.tackleBusts = matchDict.object(forKey: "tackle_busts") as? Double
            self.tackledOpp20 = matchDict.object(forKey: "tackled_opp20") as? Double
            self.tackleOppHalf = matchDict.object(forKey: "tackle_opp_half") as? Double
            self.tacklesOneOnOne = matchDict.object(forKey: "tackles_one_on_one") as? Double
            self.tryAsists = matchDict.object(forKey: "try_assists") as? Double
            self.tryCauses = matchDict.object(forKey: "try_causes") as? Double
            self.tryContributionPercentage = matchDict.object(forKey: "try_contribution_percentage") as? Double
            self.tryContributions = matchDict.object(forKey: "try_contributions") as? Double
            self.tryInvolvements = matchDict.object(forKey: "try_involvements") as? Double
            self.twentyMetreRestarts = matchDict.object(forKey: "twenty_metre_restarts") as? Double
            self.weightedKicks = matchDict.object(forKey: "weighted_kicks") as? Double
        }
    }
}
