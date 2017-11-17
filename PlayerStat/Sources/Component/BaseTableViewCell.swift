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

class HeaderModel {
    let title: String
    struct Style {
        let titleStyle: StringStyle
        let backgroundColor: UIColor
        init(titleStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopyRegular()),
                                                   .color(AppStyle.instance.colorLightGray())),
             backgroundColor: UIColor = AppStyle.instance.colorBlack()) {
            self.titleStyle = titleStyle
            self.backgroundColor = backgroundColor
        }
    }
    
    let style: Style
    let padding: AppPadding
    
    init(title: String,
         style: Style = Style(),
         padding: AppPadding = AppPadding(left: 20, right: 20, top: 10, bottom: 10)) {
        self.title = title
        self.style = style
        self.padding = padding
    }
}

class HeaderView: BaseView {
    let labelTitle = UILabel()
    var padding = AppPadding(left: 20, right: 20, top: 10, bottom: 20)
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.labelTitle)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.labelTitle.easy.layout(
            Top(self.padding.top),
            Bottom(self.padding.bottom),
            Left(self.padding.left),
            Right(self.padding.right)
        )
    }
    
    func configure(model: HeaderModel) {
        self.labelTitle.attributedText = model.title.styled(with: model.style.titleStyle)
        self.backgroundColor = model.style.backgroundColor
        
        self.padding = model.padding
        self.configureLayout()
    }
}
