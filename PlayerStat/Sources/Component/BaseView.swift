//
//  BaseView.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/16/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialise()
    }
    
    required init?(coder _: NSCoder) {
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
