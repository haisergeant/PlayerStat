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

enum CellAlignment {
    case left
    case right
}

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
        var alignment: CellAlignment
        init(shortNameStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                       .color(AppStyle.instance.colorDarkGray())),
             jumperValueStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                         .color(AppStyle.instance.colorLightGray())),
             positionValueStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                           .color(AppStyle.instance.colorLightGray())),
             imageSize: CGSize = CGSize(width: 60.0, height: 100.0),
             alignment: CellAlignment = .left) {
            self.shortNameStyle = shortNameStyle
            self.jumperValueStyle = jumperValueStyle
            self.positionValueStyle = positionValueStyle
            self.imageSize = imageSize
            self.alignment = alignment
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
         image: String,
         shortName: String,
         jumperValue: String,
         positionValue: String,
         style: Style = Style(),
         padding: Padding = Padding()) {
        self.player = player
        self.image = image
        self.shortName = shortName
        self.jumperValue = jumperValue
        self.positionValue = positionValue
        self.style = style
        self.padding = padding
    }
}

class PlayerView: BaseView {
    let imageView = UIImageView()
    
    let infoContainer = UIView()
    let labelName = UILabel()
    let labelJumper = UILabel()
    let labelPosition = UILabel()
    
    var padding = PlayerModel.Padding()
    var style = PlayerModel.Style()
    
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.imageView)
        self.addSubview(self.infoContainer)
        self.infoContainer.addSubview(self.labelName)
        self.infoContainer.addSubview(self.labelJumper)
        self.infoContainer.addSubview(self.labelPosition)
    }
 
    override func configureLayout() {
        super.configureLayout()
        self.imageView.easy.layout(
            Top(),
            Bottom(),
            Size(self.style.imageSize)
        )
        
        if style.alignment == .left {
            self.imageView.easy.layout(Left())
        } else {
            self.imageView.easy.layout(Right())
        }
        
        
    }
}
