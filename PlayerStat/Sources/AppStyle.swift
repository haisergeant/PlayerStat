//
//  AppStyle.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/16/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit

struct AppPadding {
    let left: CGFloat
    let right: CGFloat
    let top: CGFloat
    let bottom: CGFloat
    let width: CGFloat
    let height: CGFloat
    init(left: CGFloat = 0.0,
         right: CGFloat = 0.0,
         top: CGFloat = 0.0,
         bottom: CGFloat = 0.0,
         width: CGFloat = 0.0,
         height: CGFloat = 0.0) {
        self.left = left
        self.right = right
        self.top = top
        self.bottom = bottom
        self.width = width
        self.height = height
    }
}

class AppStyle {
    static let instance = AppStyle()
    
    private init() {
        FontUtils.registerFontWithFilenameString(filenameString: "OpenSans-Light")
        FontUtils.registerFontWithFilenameString(filenameString: "OpenSans-Regular")
        FontUtils.registerFontWithFilenameString(filenameString: "OpenSans-Semibold")
        FontUtils.registerFontWithFilenameString(filenameString: "OpenSans-Bold")
    }
    
    func fontBodyCopyRegular() -> UIFont {
        return UIFont(name: "OpenSans", size: 14.0)!
    }
    
    func fontBodyCopySmallRegular() -> UIFont {
        return UIFont(name: "OpenSans", size: 12.0)!
    }
    
    func fontBodyCopySemibold() -> UIFont {
        return UIFont(name: "OpenSans-Semibold", size: 14.0)!
    }
    
    func fontBodyCopySmallSemibold() -> UIFont {
        return UIFont(name: "OpenSans-Semibold", size: 12.0)!
    }
    
    func fontBodyCopyLight() -> UIFont {
        return UIFont(name: "OpenSans-Light", size: 14.0)!
    }
    
    func fontBodyCopySmallLight() -> UIFont {
        return UIFont(name: "OpenSans-Light", size: 12.0)!
    }
    
    func paddingX() -> CGFloat {
        return 20.0
    }
    
    func paddingTop() -> CGFloat {
        return 20.0
    }
    
    func paddingBottom() -> CGFloat {
        return 30.0
    }
    
    func colorPaleGray() -> UIColor {
        return UIColor(red: 227.0/255.0, green: 227.0/255.0, blue: 227.0/255.0, alpha: 1.0)
    }
    
    func colorLightGray() -> UIColor {
        return UIColor(red: 109.0/255.0, green: 113.0/255.0, blue: 136.0/255.0, alpha: 1.0)
    }
    
    func colorDarkGray() -> UIColor {
        return UIColor(red: 83.0/255.0, green: 84.0/255.0, blue: 101.0/255.0, alpha: 1.0)
    }
    
    func colorBlack() -> UIColor {
        return UIColor(red: 40.0/255.0, green: 43.0/255.0, blue: 53.0/255.0, alpha: 1.0)
    }
    
    func colorBrightBlue() -> UIColor {
        return UIColor(red: 59.0/255.0, green: 139.0/255.0, blue: 183.0/255.0, alpha: 1.0)
    }
    
    func colorOrange() -> UIColor {
        return UIColor(red: 59.0/255.0, green: 139.0/255.0, blue: 183.0/255.0, alpha: 1.0)
    }
    
    func colorLightBlue() -> UIColor {
        return UIColor(red: 231.0/255.0, green: 160.0/255.0, blue: 68.0/255.0, alpha: 1.0)
    }
}
