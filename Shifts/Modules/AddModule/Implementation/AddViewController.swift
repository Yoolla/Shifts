//
//  AddViewController.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class AddViewController: UITableViewController, AddViewProtocol {
    var presenter: AddPresenterProtocol?
    
    @IBOutlet weak var startDateTextField: UITextField!
    @IBOutlet weak var endDateTextField: UITextField!
    @IBOutlet weak var employeeCell: AddEmployeeTableViewCell!
    @IBOutlet weak var roleCell: AddRoleTableViewCell!
    @IBOutlet weak var colorCell: AddColorTableViewCell!
    
    private var overlayView: UIView!
    private var datePicker: UIDatePicker?
    
    class func get() -> AddViewController {
        let sb = UIStoryboard(name: Storyboards.Main.name(), bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.Add.name()) as! AddViewController
        return vc
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupStaticCells()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.bindView(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter?.unbindView()
    }
    
    deinit {
        print("AddViewController deallocated")
    }
    
    //MARK: - Setup
    
    private func setupStaticCells() {
        employeeCell.inject(presenter: presenter)
        roleCell.inject(presenter: presenter)
        colorCell.inject(presenter: presenter)
    }
    
    private func setupView() {
        navigationItem.title = ViewControllers.Add.title()
        
        let addItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(AddViewController.saveButtonPressed))
        navigationItem.rightBarButtonItem = addItem
        
        tableView.tableFooterView = UIView()
    }
    
    //MARK: - Helpers
    
    private func showDatePicker(title: String, completion:@escaping (Bool, Date) -> Void) {
        let pickerVC = DatePickerViewController.get()
        pickerVC?.pickerTitle = title
        
        pickerVC?.dismissHandler = { success , selectedDate in
            completion(success, selectedDate)
        }
        
        pickerVC?.modalPresentationStyle = .overCurrentContext
        self.present(pickerVC!, animated: true, completion: nil)
        
    }
    
    private func showOverlay() {
        overlayView = UIView(frame: self.view.frame)
        overlayView.backgroundColor = UIColor.black
        overlayView.alpha = 0.0
    
        if self.view.subviews.contains(overlayView) == false {
            self.view.addSubview(overlayView)
            UIView.animate(withDuration: 0.25) {
                self.overlayView.alpha = 0.5
            }
        }
    
    }
    
    private func dismissOverlay() {
        if self.view.subviews.contains(overlayView) {
            UIView.animate(withDuration: 0.25, animations: {
                self.overlayView.alpha = 0.0
            }) { (finished) in
                self.overlayView.removeFromSuperview()
            }
        }
    
    }
    
    //MARK: - Actions
    
    @objc func saveButtonPressed() {
        if presenter?.save() == false {
            let alert = UIAlertController(title: "Error", message: "Some items are not selected", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func startDateCalButtonPressed() {
        showOverlay()
        showDatePicker(title: "Start date") { (success, date) in
            self.dismissOverlay()
            if success {
                self.startDateTextField.text = date.getStringFromDateShort()
                self.presenter?.updateStartDate(date)
            }
        }
    }
    
    @IBAction func endDateCalButtonPressed() {
        showOverlay()
        showDatePicker(title: "End date") { (success, date) in
            self.dismissOverlay()
            if success {
                self.endDateTextField.text = date.getStringFromDateShort()
                self.presenter?.updateEndDate(date)
            }
        }
    }

}
