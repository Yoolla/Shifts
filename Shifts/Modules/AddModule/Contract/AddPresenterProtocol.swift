//
//  AddPresenterProtocol.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

protocol AddPresenterProtocol: Presenter<AddViewProtocol> {
    func updateName(_ name: String)
    func updateRole(_ role: String)
    func updateStartDate(_ startDate: Date)
    func updateEndDate(_ endDate: Date)
    func updateColor(_ color: String)
    func save() -> Bool
    
    var databaseService: DatabaseServiceProtocol { get }
}
