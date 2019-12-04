//
//  DataStorage.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class DatabaseService: DatabaseServiceProtocol {
    var shifts = [Shift]()
    
    init(shifts: [Shift]?) {
        self.shifts = shifts ?? [Shift]()
    }
    
    class func testShifts() -> [Shift]? {
        if let url = Bundle.main.url(forResource: "Shifts", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url, options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let decoded = try jsonDecoder.decode([String: [Shift]].self, from: data)
                if let shifts = decoded["shifts"] {
                    return shifts
                }
                
            } catch {
                print("error:\(error)")
                
            }
        }
        return nil
    }
    
    // MARK: - DatabaseServiceProtocol
    
    func getNames() -> [String] {
        let items = shifts.map({$0.name})
        let unique = Array(Set(items)).sorted()
        return unique
    }
    
    func getRoles() -> [String] {
        let items = shifts.map({$0.role})
        let unique = Array(Set(items)).sorted()
        return unique
    }
    
    func getColors() -> [String] {
        let items = shifts.map({$0.color})
        let unique = Array(Set(items)).sorted()
        return unique
    }
    
    func save(shift: Shift) {
        shifts.append(shift)
    }
    
}
