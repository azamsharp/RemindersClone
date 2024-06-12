//
//  Color+Extensions.swift
//  RemindersClone
//
//  Created by Mohammad Azam on 4/20/24.
//

import Foundation
import SwiftUI

extension Color {
    
    func toHex() -> String? {
        let uic = UIColor(self)
        guard let components = uic.cgColor.components, components.count >= 3 else {
            return nil
        }
        let r = Float(components[0])
        let g = Float(components[1])
        let b = Float(components[2])
        var a = Float(1.0)
        
        if components.count >= 4 {
            a = Float(components[3])
        }
        
        if a != Float(1.0) {
            return String(format: "%02lX%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255), lroundf(a * 255))
        } else {
            return String(format: "%02lX%02lX%02lX", lroundf(r * 255), lroundf(g * 255), lroundf(b * 255))
        }
    }
    
    init(hex: String) {
            // Remove '#' if exists
            var cleanedHex = hex
            if hex.hasPrefix("#") {
                cleanedHex = String(hex.dropFirst())
            }
            
            // Convert hex to RGB
            var rgb: UInt64 = 0
            Scanner(string: cleanedHex).scanHexInt64(&rgb)
            
            let red = Double((rgb & 0xFF0000) >> 16) / 255.0
            let green = Double((rgb & 0x00FF00) >> 8) / 255.0
            let blue = Double(rgb & 0x0000FF) / 255.0
            
            self.init(red: red, green: green, blue: blue)
        }
    
}
