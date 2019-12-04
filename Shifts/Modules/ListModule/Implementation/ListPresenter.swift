//
//  ListPresenter.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class ListPresenter: Presenter<ListViewProtocol>, ListPresenterProtocol {
    var databaseService: DatabaseServiceProtocol
    
    init(databaseService: DatabaseServiceProtocol) {
        self.databaseService = databaseService
    }
    
    deinit {
        print("ListPresenter deallocated")
    }
}


