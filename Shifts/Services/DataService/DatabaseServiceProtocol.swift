//
//  DatabaseServiceProtocol.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

protocol DatabaseServiceProtocol {
    func getNames() -> [String]
    func getRoles() -> [String]
    func getColors() -> [String]
    func save(shift: Shift)

    var shifts: [Shift] { get }
}
