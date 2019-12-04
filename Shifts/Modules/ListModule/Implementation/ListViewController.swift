//
//  ListViewController.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, ListViewProtocol {
    var presenter: ListPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    class func get() -> ListViewController {
        let sb = UIStoryboard(name: Storyboards.Main.name(), bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.List.name()) as! ListViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.bindView(self)
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.unbindView()
    }
    
    deinit {
        print("ListViewController deallocated")
    }
    
    //MARK: - Setup
    
    private func setupView() {
        navigationItem.title = ViewControllers.List.title()
        
        let addItem = UIBarButtonItem(title: "Add Shift", style: .plain, target: self, action: #selector(ListViewController.addButtonPressed))
        navigationItem.rightBarButtonItem = addItem
        
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - Actions
    
    @objc func addButtonPressed() {
        showAddViewController()
    }
    
    //MARK: - Navigation
    
    private func showAddViewController() {
        let addViewController = AddViewController.get()
        AddModuleConfigurator.configure(view: addViewController)
        navigationController?.pushViewController(addViewController, animated: true)
    }
    
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.databaseService.shifts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let shift = presenter?.databaseService.shifts[indexPath.row] else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ListTableViewCell.reuseIdentifier) as! ListTableViewCell
        cell.setup(withShift: shift)

        return cell
    }
}

extension ListViewController: UITableViewDelegate { 
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }
}

