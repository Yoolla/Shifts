//
//  AddModuleConfigurator.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class AddModuleConfigurator {
    static func configure(view: AddViewProtocol) {
        var view = view
        
        let di = DI.shared
        
        let presenter = AddPresenter(databaseService: di.resolve(DatabaseServiceProtocol.self))
        view.presenter = presenter
    }
}
