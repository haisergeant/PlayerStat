//
//  HeaderView.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/18/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import EasyPeasy
import BonMot

class HeaderModel {
    let title: String
    let rightTitle: String?
    struct Style {
        let titleStyle: StringStyle
        let rightTitleStyle: StringStyle
        let backgroundColor: UIColor
        init(titleStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopyRegular()),
                                                   .color(AppStyle.instance.colorLightGray())),
             rightTitleStyle: StringStyle = StringStyle(.font(AppStyle.instance.fontBodyCopyRegular()),
                                                              .color(AppStyle.instance.colorLightGray()),
                                                              .alignment(.right)),
             backgroundColor: UIColor = AppStyle.instance.colorBlack()) {
            self.titleStyle = titleStyle
            self.rightTitleStyle = rightTitleStyle
            self.backgroundColor = backgroundColor
        }
    }
    
    class func cellStyle() -> Style {
        return Style(titleStyle: StringStyle(.font(AppStyle.instance.fontBodyCopySmallRegular()),
                                             .color(AppStyle.instance.colorPaleGray())),
                     rightTitleStyle: StringStyle(.font(AppStyle.instance.fontBodyCopySemibold()),
                                                  .color(AppStyle.instance.colorBrightBlue())),
                     backgroundColor: .white)
    }
    
    let style: Style
    let padding: AppPadding
    
    init(title: String, rightTitle: String? = nil,
         style: Style = Style(),
         padding: AppPadding = AppPadding(left: 20, right: 20, top: 10, bottom: 10)) {
        self.title = title
        self.rightTitle = rightTitle
        self.style = style
        self.padding = padding
    }
}

class HeaderView: BaseView {
    let labelTitle = UILabel()
    let labelRightTitle = UILabel()
    var padding = AppPadding(left: 20, right: 20, top: 10, bottom: 20)
    override func configureSubviews() {
        super.configureSubviews()
        self.addSubview(self.labelTitle)
        self.addSubview(self.labelRightTitle)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.labelTitle.easy.layout(
            Top(self.padding.top),
            Bottom(self.padding.bottom),
            Left(self.padding.left),
            Right(self.padding.right).to(self.labelRightTitle, .left)
        )
        
        self.labelRightTitle.easy.layout(
            Top(self.padding.top),
            Bottom(self.padding.bottom),
            Right(self.padding.right)
        )
    }
    
    func configure(model: HeaderModel) {
        self.labelTitle.attributedText = model.title.styled(with: model.style.titleStyle)
        self.labelRightTitle.attributedText = model.rightTitle?.styled(with: model.style.rightTitleStyle)
        self.backgroundColor = model.style.backgroundColor
        
        self.padding = model.padding
        self.configureLayout()
    }
}

class TitleAndDetailCell: BaseTableViewCell {
    let view = HeaderView()
    
    init() {
        super.init(identifier: "TitleAndDetailCell")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configureSubviews() {
        super.configureSubviews()
        self.contentView.addSubview(self.view)
    }
    
    override func configureLayout() {
        super.configureLayout()
        self.view.easy.layout(Edges())
    }
    
    func configure(model: HeaderModel) {
        self.view.configure(model: model)
    }
}
