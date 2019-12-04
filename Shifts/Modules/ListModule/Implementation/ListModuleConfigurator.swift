//
//  ListModuleConfigurator.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class ListModuleConfigurator {
    static func configure(view: ListViewProtocol) {
        var view = view
        
        let di = DI.shared
        
        let presenter = ListPresenter(databaseService: di.resolve(DatabaseServiceProtocol.self))
        view.presenter = presenter
    }
}
