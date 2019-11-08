//
//  Person.swift
//  Project10
//
//  Created by Jason Mitchell on 3/21/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
