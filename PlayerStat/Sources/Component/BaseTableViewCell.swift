//
//  BaseTableViewCell.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/16/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import BonMot
import EasyPeasy

class BaseTableViewCell: UITableViewCell {
    init(identifier: String) {
        super.init(style: .default, reuseIdentifier: identifier)
        self.initialise()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialise() {
        self.configureSubviews()
        self.configureLayout()
        self.configureActions()
        self.configureStyle()
        self.configureContent()
    }
    
    func configureSubviews() {}
    
    func configureLayout() {}
    
    func configureActions() {}
    
    func configureStyle() {}
    
    func configureContent() {}
}
