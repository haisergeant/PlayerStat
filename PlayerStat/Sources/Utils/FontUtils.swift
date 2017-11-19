//
//  FontUtils.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/16/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit

class FontUtils {
    class func registerFontWithFilenameString(filenameString: String) {
        let fontPath = Bundle(for: AppStyle.self).path(forResource: filenameString, ofType: "ttf")
        
        let fontData = NSData(contentsOfFile: fontPath!)
        let dataProvider = CGDataProvider(data: fontData!)
        let fontRef = CGFont(dataProvider!)
        var errorRef: Unmanaged<CFError>?
        
        if CTFontManagerRegisterGraphicsFont(fontRef!, &errorRef) == false {
        } else {
        }
    }
}
