//
//  AddEmployeeTableViewCell.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class AddColorTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!

    weak var presenter: AddPresenterProtocol?

    func inject(presenter: AddPresenterProtocol?) {
        self.presenter = presenter
    }
}

extension AddColorTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.databaseService.getColors().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.databaseService.getColors()[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item
        return cell
    }
}

extension AddColorTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = presenter?.databaseService.getColors()[indexPath.row] {
            presenter?.updateColor(item)
        }
    }
}
