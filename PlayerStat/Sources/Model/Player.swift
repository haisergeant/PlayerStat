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
    var team: Team?
    
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
    let error: Double?
    let goals: Double?
    let intercepted: Double?
    let intercepts: Double?
    let kicks: Double?
    let matchPoints: Double?
    let possessions: Double?
    let runs: Double?
    let tackles: Double?
    let matchTries: Double?
    let minsPlayed: Double?
    let attackingKicks: Double?
    let bombCaught: Double?
    let bombDropped: Double?
    let chargedDown: Double?
    let chargesDown: Double?
    let dropOuts: Double?
    let dummyHalfRuns: Double?
    let effectiveOffloads: Double?
    let fantasyPoints: Double?
    let fieldGoalAttemps: Double?
    let fieldGoalMisses: Double?
    let fieldGoals: Double?
    let forcedDropOuts: Double?
    let generalPlayPass: Double?
    let goalMisses: Double?
    let ineffectiveTackles: Double?
    let inGoalEscapes: Double?
    let interchangesOff: Double?
    let interchangesOn: Double?
    let kickErrors: Double?
    let kickMetres: Double?
    let kickReturnMetres: Double?
    let kickReturns: Double?
    let kicks4020: Double?
    let kicksDead: Double?
    let lastTouchTryAssists: Double?
    let lineBreakAssists: Double?
    let lineBreakCauses: Double?
    let lineBreaks: Double?
    let lineEngagements: Double?
    let longKicks: Double?
    let missedTackles: Double?
    let offLoads: Double?
    let onePassRuns: Double?
    let penaltiesConceded: Double?
    let playTheBalls: Double?
    let runMetres: Double?
    let runs7lessMeters: Double?
    let runs8plusMeters: Double?
    let sendOffs: Double?
    let sinBins: Double?
    let stealsOneOnOne: Double?
    let stolenOneOnOne: Double?
    let tackleBusts: Double?
    let tackledOpp20: Double?
    let tackleOppHalf: Double?
    let tacklesOneOnOne: Double?
    let tryAsists: Double?
    let tryCauses: Double?
    let tryContributionPercentage: Double?
    let tryContributions: Double?
    let tryInvolvements: Double?
    let twentyMetreRestarts: Double?
    let weightedKicks: Double?
    
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
        
        self.error = dictionary.object(forKey: "errors") as? Double
        self.goals = dictionary.object(forKey: "goals") as? Double
        self.intercepted = dictionary.object(forKey: "intercepted") as? Double
        self.intercepts = dictionary.object(forKey: "intercepts") as? Double
        
        self.kicks = dictionary.object(forKey: "kicks") as? Double
        self.matchPoints = dictionary.object(forKey: "points") as? Double
        self.possessions = dictionary.object(forKey: "possessions") as? Double
        self.runs = dictionary.object(forKey: "runs") as? Double
        self.tackles = dictionary.object(forKey: "tackles") as? Double
        self.matchTries = dictionary.object(forKey: "tries") as? Double
        self.minsPlayed = dictionary.object(forKey: "mins_played") as? Double
        self.attackingKicks = dictionary.object(forKey: "attacking_kicks") as? Double
        self.bombCaught = dictionary.object(forKey: "bombs_caught") as? Double
        self.bombDropped = dictionary.object(forKey: "bombs_dropped") as? Double
        self.chargedDown = dictionary.object(forKey: "charged_down") as? Double
        self.chargesDown = dictionary.object(forKey: "charges_down") as? Double
        self.dropOuts = dictionary.object(forKey: "drop_outs") as? Double
        self.dummyHalfRuns = dictionary.object(forKey: "dummy_half_runs") as? Double
        self.effectiveOffloads = dictionary.object(forKey: "effective_offloads") as? Double
        self.fantasyPoints = dictionary.object(forKey: "fantasy_points") as? Double
        self.fieldGoalAttemps = dictionary.object(forKey: "field_goal_attempts") as? Double
        self.fieldGoalMisses = dictionary.object(forKey: "field_goal_misses") as? Double
        self.fieldGoals = dictionary.object(forKey: "field_goals") as? Double
        self.forcedDropOuts = dictionary.object(forKey: "forced_drop_outs") as? Double
        self.generalPlayPass = dictionary.object(forKey: "general_play_pass") as? Double
        self.goalMisses = dictionary.object(forKey: "goal_misses") as? Double
        self.ineffectiveTackles = dictionary.object(forKey: "ineffective_tackles") as? Double
        self.inGoalEscapes = dictionary.object(forKey: "in_goal_escapes") as? Double
        self.interchangesOff = dictionary.object(forKey: "interchanges_off") as? Double
        self.interchangesOn = dictionary.object(forKey: "interchanges_on") as? Double
        self.kickErrors = dictionary.object(forKey: "kick_errors") as? Double
        self.kickMetres = dictionary.object(forKey: "kick_metres") as? Double
        self.kickReturnMetres = dictionary.object(forKey: "kick_return_metres") as? Double
        self.kickReturns = dictionary.object(forKey: "kick_returns") as? Double
        self.kicks4020 = dictionary.object(forKey: "kicks_4020") as? Double
        self.kicksDead = dictionary.object(forKey: "kicks_dead") as? Double
        self.lastTouchTryAssists = dictionary.object(forKey: "last_touch_try_assists") as? Double
        self.lineBreakAssists = dictionary.object(forKey: "line_break_assists") as? Double
        self.lineBreakCauses = dictionary.object(forKey: "line_break_causes") as? Double
        self.lineBreaks = dictionary.object(forKey: "line_breaks") as? Double
        self.lineEngagements = dictionary.object(forKey: "line_engagements") as? Double
        self.longKicks = dictionary.object(forKey: "long_kicks") as? Double
        self.missedTackles = dictionary.object(forKey: "missed_tackles") as? Double
        self.offLoads = dictionary.object(forKey: "off_loads") as? Double
        self.onePassRuns = dictionary.object(forKey: "one_pass_runs") as? Double
        self.penaltiesConceded = dictionary.object(forKey: "penalties_conceded") as? Double
        self.playTheBalls = dictionary.object(forKey: "play_the_balls") as? Double
        self.runMetres = dictionary.object(forKey: "run_metres") as? Double
        self.runs7lessMeters = dictionary.object(forKey: "runs_7less_meters") as? Double
        self.runs8plusMeters = dictionary.object(forKey: "runs_8plus_meters") as? Double
        self.sendOffs = dictionary.object(forKey: "send_offs") as? Double
        self.sinBins = dictionary.object(forKey: "sin_bins") as? Double
        self.stealsOneOnOne = dictionary.object(forKey: "steals_one_on_one") as? Double
        self.stolenOneOnOne = dictionary.object(forKey: "stolen_one_on_one") as? Double
        self.tackleBusts = dictionary.object(forKey: "tackle_busts") as? Double
        self.tackledOpp20 = dictionary.object(forKey: "tackled_opp20") as? Double
        self.tackleOppHalf = dictionary.object(forKey: "tackle_opp_half") as? Double
        self.tacklesOneOnOne = dictionary.object(forKey: "tackles_one_on_one") as? Double
        self.tryAsists = dictionary.object(forKey: "try_assists") as? Double
        self.tryCauses = dictionary.object(forKey: "try_causes") as? Double
        self.tryContributionPercentage = dictionary.object(forKey: "try_contribution_percentage") as? Double
        self.tryContributions = dictionary.object(forKey: "try_contributions") as? Double
        self.tryInvolvements = dictionary.object(forKey: "try_involvements") as? Double
        self.twentyMetreRestarts = dictionary.object(forKey: "twenty_metre_restarts") as? Double
        self.weightedKicks = dictionary.object(forKey: "weighted_kicks") as? Double
    }
}
