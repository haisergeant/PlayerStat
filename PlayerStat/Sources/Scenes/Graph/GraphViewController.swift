//
//  GraphViewController.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/19/17.
//  Copyright (c) 2017 haile. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol GraphViewControllerInput
{
    
}

protocol GraphViewControllerOutput {
    
}

class GraphViewController: BaseViewController, GraphViewControllerInput {
    var output: GraphViewControllerOutput!
    var router: GraphRouter!
    
    // MARK: - Object lifecycle
    var matches: [Match]!
    init(matches: [Match]) {
        super.init()
        self.matches = matches
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
