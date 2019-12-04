//
//  AddEmployeeTableViewCell.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class AddEmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var tableView: UITableView!
    
    weak var presenter: AddPresenterProtocol?

    func inject(presenter: AddPresenterProtocol?) {
        self.presenter = presenter
    }
}

extension AddEmployeeTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.databaseService.getNames().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter?.databaseService.getNames()[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = item
        return cell
    }
}

extension AddEmployeeTableViewCell: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       if let item = presenter?.databaseService.getNames()[indexPath.row] {
            presenter?.updateName(item)
        }
    }
}
