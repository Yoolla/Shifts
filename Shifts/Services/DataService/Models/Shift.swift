//
//  Shift.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation
import UIKit

struct Shift: Codable {
    let role: String
    let name: String
    let startDate: String
    let endDate: String
    let color: String
    
    enum CodingKeys: String, CodingKey {
        case role = "role"
        case name = "name"
        case startDate = "start_date"
        case endDate = "end_date"
        case color = "color"
    }
}

extension Shift {
    func getColor() -> UIColor? {
        switch self.color {
        case "red":
            return UIColor.red
        case "blue":
            return UIColor.blue
        case "green":
            return UIColor.green
        default:
            return nil
        }
    }
}
