//
//  ListTableViewCell.swift
//  Shifts
//
//  Created by Alexander Yolkin on 11/19/19.
//  Copyright © 2019 Oleksandr Yolkin. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorLabel.layer.cornerRadius = colorLabel.frame.width / 2
        colorLabel.clipsToBounds = true
    }
    
    override func prepareForReuse() {
        titleLabel.text = ""
        timeLabel.text = ""
        colorLabel.backgroundColor = UIColor.clear
    }

    func setup(withShift shift: Shift) {
        var dateInTitle = ""
        var timeInTitle = ""
        if let startDate = shift.startDate.dateFromString(), let endDate = shift.endDate.dateFromString() {
            let startHumanReadableDay = startDate.getHumanReadableDayString()
            let startDay = startDate.getDay()
            let startMonth = startDate.getMonth()
            
            let startHour12 = startDate.getHour12String().dropLast(3)
            let endHour12 = endDate.getHour12String()
            
            dateInTitle = "\(startHumanReadableDay) \(startMonth)/\(startDay)"
            timeInTitle = "\(startHour12)-\(endHour12)"
        }
       
        titleLabel.text = "\(shift.name) (\(shift.role)) \(dateInTitle)"
        colorLabel.backgroundColor = shift.getColor()
        timeLabel.text = timeInTitle
        
        
    }
    
}

extension ListTableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self.self)
    }
}
