//
//  AddEmployeeTableViewCell.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class AddRoleTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!

    weak var presenter: AddPresenterProtocol?

    func inject(presenter: AddPresenterProtocol?) {
        self.presenter = presenter
    }
}

extension AddRoleTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.databaseService.getRoles().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.databaseService.getRoles()[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item
        return cell
    }
}

extension AddRoleTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = presenter?.databaseService.getRoles()[indexPath.row] {
            presenter?.updateRole(item)
        }
    }
}
