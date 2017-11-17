//
//  UIImageView+Utils.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/17/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Alamofire

extension UIImageView {
    func image(from url: String, defaultImageName: String) {
        CacheService.downloadImage(url: url, defaultImageName: defaultImageName)
            .startWithResult { [weak self] result in
                if let image = result.value {
                    self?.image = image
                }
        }
    }
}
