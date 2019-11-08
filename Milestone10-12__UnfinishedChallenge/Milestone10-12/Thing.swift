//
//  Thing.swift
//  Milestone10-12
//
//  Created by Jason Mitchell on 3/25/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import Foundation

class Thing: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
