//
//  Petition.swift
//  Project7
//
//  Created by Jason Mitchell on 3/10/19.
//  Copyright © 2019 Jason Mitchell. All rights reserved.
//

import Foundation

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
