//
//  AppConstants.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

enum Storyboards: String {
    case Main = "Main"
    
    func name() -> String {
        return self.rawValue
    }
}

enum ViewControllers: String {
    case List = "ListViewController"
    case Add = "AddViewController"
    case DatePicker = "DatePickerViewController"
    
    func name() -> String {
        return self.rawValue
    }
    
    func title() -> String {
        switch self {
        case .List:
            return "Coffe Co Shifts"
        case .Add:
            return "Create a Shift"
        case .DatePicker:
            return "Select Date"
        }
    }
}
