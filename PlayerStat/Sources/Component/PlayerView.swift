//
//  PlayerView.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/16/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import BonMot
import EasyPeasy

struct PlayerModel {
    let player: Player

    let image: String
    let shortName: String
    let jumperValue: String
    let positionValue: String
    
    let style: Style
    struct Style {
        var shortNameStyle: StringStyle
        var jumperValueStyle: StringStyle
        var positionValueStyle: StringStyle
        var imageSize: CGSize
        var alignment: NSTextAlignment
        var separatorColor: UIColor
        init(shortNameStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                       .color(AppStyle.instance.colorDarkGray())),
             jumperValueStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                         .color(AppStyle.instance.colorLightGray())),
             positionValueStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                           .color(AppStyle.instance.colorLightGray())),
             imageSize: CGSize = CGSize(width: 60.0, height: 100.0),
             alignment: NSTextAlignment = .left,
             separatorColor: UIColor = AppStyle.instance.colorPaleGray()) {
            self.shortNameStyle = shortNameStyle
            self.jumperValueStyle = jumperValueStyle
            self.positionValueStyle = positionValueStyle
            self.imageSize = imageSize
            self.alignment = alignment
            self.separatorColor = separatorColor
        }
    }
    
    let padding: Padding
    struct Padding {
        var appPadding: AppPadding
        var verticalSpacing: CGFloat
        init(appPadding: AppPadding = AppPadding(left: 20, right: 20, top: 10, bottom: 20),
             verticalSpacing: CGFloat = 10) {
            self.appPadding = appPadding
            self.verticalSpacing = verticalSpacing
        }
    }
    
    init(player: Player,
         style: Style = Style(),
         padding: Padding = Padding()) {
        self.player = player
        self.image = String(format: URL.PLAYER_AVATAR_URL, self.player.id)
        self.shortName = player.shortName
        self.jumperValue = "Jumper No: \(String(player.jumperNumber))\nStat Val: \(String(format: "%.f", player.statValue))"
        self.positionValue = player.position
        self.style = style
        self.padding = padding
    }
}

class PlayerView: BaseView {
    let imageViewContainer = UIView()
    let imageView = UIImageView()
    
    let infoContainer = UIView()
    let labelName = UILabel()
    let labelJumper = UILabel()
    let labelPosition = UILabel()
    
    let separator = UIView()
    
    var padding = PlayerModel.Padding()
    var style = PlayerModel.Style()
    
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.imageViewContainer)
        self.imageViewContainer.addSubview(self.imageView)
        
        self.addSubview(self.infoContainer)
        self.infoContainer.addSubview(self.labelName)
        self.infoContainer.addSubview(self.labelJumper)
        self.infoContainer.addSubview(self.labelPosition)
        
        self.addSubview(self.separator)
        
        self.labelName.numberOfLines = 0
        self.labelJumper.numberOfLines = 0
        self.labelPosition.numberOfLines = 0
        self.imageViewContainer.clipsToBounds = true
        self.imageView.contentMode = .scaleAspectFill
        self.imageViewContainer.backgroundColor = .black
    }
 
    override func configureLayout() {
        super.configureLayout()
        self.imageViewContainer.easy.clear()
        self.infoContainer.easy.clear()
        self.imageViewContainer.easy.layout(
            Top(),
            Bottom(),
            Width(self.style.imageSize.width)
        )
        
        self.imageView.easy.layout(Edges())
        
        self.infoContainer.easy.layout(
            Top(),
            Bottom()
        )
        
        if self.style.alignment == .left {
            self.imageViewContainer.easy.layout(Left())
            self.infoContainer.easy.layout(
                Left().to(self.imageView, .right),
                Right()
            )
        } else {
            self.imageViewContainer.easy.layout(Right())
            self.infoContainer.easy.layout(
                Right().to(self.imageView, .left),
                Left()
            )
        }
        
        self.labelName.easy.layout(
            Top(self.padding.appPadding.top),
            Left(self.padding.appPadding.left),
            Right(self.padding.appPadding.right)
        )
        self.labelName.textAlignment = self.style.alignment
        
        self.labelJumper.easy.layout(
            Top(self.padding.verticalSpacing).to(self.labelName, .bottom),
            Left(self.padding.appPadding.left),
            Right(self.padding.appPadding.right)
        )
        self.labelJumper.textAlignment = self.style.alignment
        
        self.labelPosition.easy.layout(
            Top(>=self.padding.verticalSpacing).to(self.labelJumper, .bottom),
            Left(self.padding.appPadding.left),
            Right(self.padding.appPadding.right),
            Bottom(self.padding.appPadding.bottom)
        )
        self.labelPosition.textAlignment = self.style.alignment
        
        self.separator.easy.layout(
            Left(),
            Right(),
            Bottom(),
            Height(1)
        )
        
    }
    
    func configure(model: PlayerModel) {
        self.imageView.image(from: model.image, defaultImageName: "default-avatar")
        self.labelName.attributedText = model.shortName.styled(with: model.style.shortNameStyle)
        self.labelJumper.attributedText = model.jumperValue.styled(with: model.style.jumperValueStyle)
        self.labelPosition.attributedText = model.positionValue.styled(with: model.style.positionValueStyle)
        self.separator.backgroundColor = model.style.separatorColor
        
        self.style = model.style
        self.padding = model.padding
        self.configureLayout()
    }
}
