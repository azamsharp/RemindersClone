//
//  MyList.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/20/24.
//

import Foundation
import SwiftData

@Model
class MyList {
    
    var name: String = ""
    var colorCode: String = "#34C759"
    
    @Relationship(deleteRule: .cascade)
    var reminders: [Reminder]?
    
    init(name: String, colorCode: String) {
        self.name = name
        self.colorCode = colorCode
    }
}
