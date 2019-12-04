//
//  ListPresenterProtocol.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

protocol ListPresenterProtocol: Presenter<ListViewProtocol> {
    var databaseService: DatabaseServiceProtocol { get }
}
