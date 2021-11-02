//
//  Properties.swift
//  FlightsAppBookingDemo
//
//  Created by Pradeep's Macbook on 13/08/21.
//

import UIKit
import SwiftUI

extension Color {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> Color {
        return .init(red: red / 255, green: green / 255, blue: blue / 255)
    }
    
    static var themeColor: Color {
        return .rgb(red: 147, green: 157, blue: 157)
    }
    
}
