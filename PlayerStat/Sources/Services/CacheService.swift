//
//  CacheService.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/17/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit
import ReactiveCocoa
import ReactiveSwift
import Alamofire

class CacheService {
    class func downloadImage(url: String, defaultImageName: String? = nil) -> SignalProducer<UIImage, NSError> {
        return SignalProducer { observer, disposable in
            let fileName = (url as NSString).lastPathComponent
            
            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let downloadDirectory = documentDirectory + "/" + "Download"
            let fullFileName = downloadDirectory + "/" + fileName
            
            if FileManager.default.fileExists(atPath: fullFileName) {
                CacheService.loadImageFromPath(path: fullFileName, defaultImageName: defaultImageName) { (image) in
                    observer.send(value: image)
                }
            } else {
                // File does not exist, download it
                let downloadDestination: DownloadRequest.DownloadFileDestination = { _, _ in
                    var documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
                    documentURL.appendPathComponent("Download")
                    documentURL.appendPathComponent(fileName)
                    return (documentURL, [.removePreviousFile, .createIntermediateDirectories])
                }
                
                Alamofire.download(url, to: downloadDestination).response { response in
                    if response.error == nil, let imagePath = response.destinationURL?.path {
                        CacheService.loadImageFromPath(path: imagePath, defaultImageName: defaultImageName) { image in
                            observer.send(value: image)
                        }
                    }
                }
            }
            
        }
    }
    
    private class func loadImageFromPath(path: String, defaultImageName: String? = nil, completion: @escaping ((UIImage)->Void)) {
        DispatchQueue.global(qos: .background).async {
            if let data = NSData(contentsOfFile: path), let image = UIImage(data: data as Data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            } else if let defaultName = defaultImageName, let image = UIImage(named: defaultName) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }
    }
}
