//
//  Presenter.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import Foundation

class Presenter<ViewType> {

    private(set) var view: ViewType?

    func bindView(_ view: ViewType) {
        self.view = view
    }

    func unbindView() {
        view = nil
    }

    func viewReadyForPresentation() {

    }
}
