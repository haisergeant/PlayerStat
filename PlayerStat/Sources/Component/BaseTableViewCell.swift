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

struct MatchModel {
    var playersModel: [PlayersModel]
}

class PlayersModel {
    let leftPlayer: PlayerModel?
    let rightPlayer: PlayerModel?
    init(leftPlayer: PlayerModel? = nil, rightPlayer: PlayerModel? = nil) {
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
    }
}

class PlayersCell: BaseTableViewCell {
    let leftView = PlayerView()
    let rightView = PlayerView()
    
    override func configureSubviews() {
        super.configureSubviews()
        self.contentView.addSubview(self.leftView)
        self.contentView.addSubview(self.rightView)
        
        self.leftView.setContentCompressionResistancePriority(.required, for: .vertical)
        self.rightView.setContentCompressionResistancePriority(.required, for: .vertical)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.leftView.easy.layout(
            Top(),
            Left(),
            Bottom()
        )
        self.rightView.easy.layout(
            Top(),
            Right(),
            Bottom(),
            Left().to(self.leftView, .right),
            Width().like(self.leftView)
        )
    }

    func configure(model: PlayersModel) {
        if let playerA = model.leftPlayer {
            self.leftView.configure(model: playerA)
        }
        if let playerB = model.rightPlayer {
            self.rightView.configure(model: playerB)
        }
    }
    
}
