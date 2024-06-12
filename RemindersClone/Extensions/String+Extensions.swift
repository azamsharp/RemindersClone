//
//  String+Extensions.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/21/24.
//

import Foundation

extension String {
    
    var isEmptyOrWhitespace: Bool {
        trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
