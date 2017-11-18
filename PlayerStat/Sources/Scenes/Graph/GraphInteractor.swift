//
//  GraphInteractor.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/19/17.
//  Copyright (c) 2017 haile. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so you can apply
//  clean architecture to your iOS and Mac projects, see http://clean-swift.com
//

import UIKit

protocol GraphInteractorInput {
    func load(request: GraphRequest)
}

protocol GraphInteractorOutput {
    func present(response: GraphResponse)
}

class GraphInteractor: GraphInteractorInput {
    var output: GraphInteractorOutput!

    func load(request: GraphRequest) {
        self.output.present(response: GraphResponse(matches: request.matches))
    }
}
