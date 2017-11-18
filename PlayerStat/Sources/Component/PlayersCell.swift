//
//  PlayersCell.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/18/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import BonMot
import EasyPeasy

struct MatchModel {
    var headerModel: HeaderModel
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

protocol PlayersCellDelegate: class {
    func navigateToPlayer(player: Player)
}

class PlayersCell: BaseTableViewCell {
    let leftView = PlayerView()
    let rightView = PlayerView()
    let middleSeparator = UIView()
    let bottomSeparator = UIView()
    
    let buttonLeft = UIButton()
    let buttonRight = UIButton()
    
    weak var delegate: PlayersCellDelegate?
    init(delegate: PlayersCellDelegate?) {
        self.delegate = delegate
        super.init(identifier: "PlayersCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        self.contentView.addSubview(self.leftView)
        self.leftView.addSubview(self.buttonLeft)
        self.contentView.addSubview(self.rightView)
        self.rightView.addSubview(self.buttonRight)
        self.contentView.addSubview(self.middleSeparator)
        self.contentView.addSubview(self.bottomSeparator)
        
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
        
        self.middleSeparator.easy.layout(
            Top(),
            Bottom(),
            Width(1),
            Left().to(self.leftView, .right)
        )
        
        self.rightView.easy.layout(
            Top(),
            Right(),
            Bottom(),
            Left().to(self.middleSeparator, .right),
            Width().like(self.leftView)
        )
        
        self.bottomSeparator.easy.layout(
            Left(),
            Right(),
            Bottom(),
            Height(1)
        )
        
        self.buttonLeft.easy.layout(Edges())
        self.buttonRight.easy.layout(Edges())
    }
    
    override func configureStyle() {
        super.configureStyle()
        self.middleSeparator.backgroundColor = AppStyle.instance.colorPaleGray()
        self.bottomSeparator.backgroundColor = AppStyle.instance.colorPaleGray()
    }
    
    func configure(model: PlayersModel) {
        if let playerA = model.leftPlayer {
            self.leftView.configure(model: playerA)
            self.buttonLeft.action { [weak self] _ in
                self?.delegate?.navigateToPlayer(player: playerA.player)
            }
        }
        if let playerB = model.rightPlayer {
            self.rightView.configure(model: playerB)
            self.buttonRight.action { [weak self] _ in
                self?.delegate?.navigateToPlayer(player: playerB.player)
            }
        }
    }
}
