//
//  DatePickerViewController.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    var pickerTitle: String!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var selectedDate: Date = Date()
    
    var dismissHandler: (Bool, Date) -> Void = { _,_  in }
    
    @objc class func get() -> DatePickerViewController? {
        let sb = UIStoryboard(name: Storyboards.Main.name(), bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: ViewControllers.DatePicker.name()) as! DatePickerViewController
        return vc
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTapGesture()
        setupDatePicker()
        
        if selectedDate < Date() {
            selectedDate = Date()
        }
        
        datePicker.setDate(selectedDate, animated: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("PickerVC deallocated")
    }
    
    // MARK: - Helpers
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapHandler(_:)))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    private func setupDatePicker() {
        datePicker.datePickerMode = .dateAndTime

        let date = NSDate()
        let year = Calendar.current.component(.year, from: date as Date)

        var maxComponents = DateComponents()
        maxComponents.day = 31
        maxComponents.month = 12
        maxComponents.year = year + 1

        let minDate = Date()
        let maxDate = NSCalendar.current.date(from: maxComponents)

        datePicker.minimumDate = minDate
        datePicker.maximumDate = maxDate

    }
    
    private func dismiss(_ success: Bool) {
        self.dismiss(animated: true, completion: nil)
        
        dismissHandler(success, datePicker.date)
    }
    
    // MARK: - Actions
    
    @objc private func tapHandler(_ sender: UITapGestureRecognizer) {
        dismiss(false)
    }
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(false)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        dismiss(true)
    }

}
