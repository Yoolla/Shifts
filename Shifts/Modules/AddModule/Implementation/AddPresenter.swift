//
//  AddPresenter.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class AddPresenter: Presenter<AddViewProtocol>, AddPresenterProtocol {
    var databaseService: DatabaseServiceProtocol
    
    private var role: String?
    private var name: String?
    private var startDate: String?
    private var endDate: String?
    private var color: String?
    
    init(databaseService: DatabaseServiceProtocol) {
        self.databaseService = databaseService
    }
    
    deinit {
        print("AddPresenter deallocated")
    }
    
    // MARK: - AddPresenterProtocol
    
    func updateName(_ name: String) {
        self.name = name
    }
    
    func updateRole(_ role: String) {
        self.role = role
    }
    
    func updateStartDate(_ startDate: Date) {
        self.startDate = startDate.getStringFromDateLong()
    }
    
    func updateEndDate(_ endDate: Date) {
        self.endDate = endDate.getStringFromDateLong()
    }
    
    func updateColor(_ color: String) {
        self.color = color
    }
    
    func save() -> Bool  {
        if let role = role, let name = name, let startDate = startDate, let endDate = endDate, let color = color {
            let shift = Shift(role: role, name: name, startDate: startDate, endDate: endDate, color: color)
            databaseService.save(shift: shift)
            return true
            
        } else {
            return false
            
        }
    }
    
}
