//
//  Checklist.swift
//  Checklists
//
//  Created by Marcin on 02.03.2015.
//  Copyright (c) 2015 Marcin. All rights reserved.
//

import UIKit

class Checklist: NSObject {
    var name = ""
    init(name: String) {
        self.name = name
        super.init()
    }
}
