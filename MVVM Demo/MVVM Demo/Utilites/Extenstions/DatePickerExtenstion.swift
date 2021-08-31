//
//  DatePickerExtenstion.swift
//  Kings Court
//
//  Created by gwl on 04/11/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit
extension UITextField {
    func setInputViewTimePicker(target: Any, selector: Selector, mode: UIDatePicker.Mode, enableFutureDate: Bool) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))//1
        if mode == .time {
            datePicker.datePickerMode = .time
        }
        if mode == .date {
            datePicker.datePickerMode = .date
        }
        if mode == .dateAndTime {
            datePicker.datePickerMode = .dateAndTime
        }
        self.inputView = datePicker //3
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels // Replace .inline with .compact
        }
        if enableFutureDate {
            datePicker.minimumDate = NSDate() as Date
        } else {
            datePicker.maximumDate = NSDate() as Date
        }
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) // 4
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // 5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) // 7
        toolBar.setItems([cancel, flexible, barButton], animated: false) // 8
        self.inputAccessoryView = toolBar // 9
    }
    func setInputViewWithTimeDifferencePicker(target: Any, selector: Selector,
                                              mode: UIDatePicker.Mode, minDate: Date? = nil, maxDate: Date? = nil, currentDateWithTime: Date? = nil) {
        // Create a UIDatePicker object and assign to inputView
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 216))// 1
        if mode == .time {
            datePicker.datePickerMode = .time
        }
        if mode == .date {
            datePicker.datePickerMode = .date
        }
        if mode == .dateAndTime {
            datePicker.datePickerMode = .dateAndTime
        }
        self.inputView = datePicker // 3
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels // Replace .inline with .compact
        }
        if let minimumDateValue = minDate {
            datePicker.minimumDate = minimumDateValue
        } else {
            datePicker.minimumDate = nil
        }
        if let maximumDateValue = maxDate {
            datePicker.maximumDate = maximumDateValue
        } else {
            datePicker.maximumDate = nil
        }
        if let date = currentDateWithTime {
            datePicker.date = date
        }
        // Create a toolbar and assign it to inputAccessoryView
        let toolBar = UIToolbar(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: 44.0)) // 4
        toolBar.isTranslucent = true
        toolBar.tintColor = .black
        let flexible = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil) // 5
        let cancel = UIBarButtonItem(title: "Cancel", style: .plain, target: nil, action: #selector(tapCancel)) // 6
        let barButton = UIBarButtonItem(title: "Done", style: .plain, target: target, action: selector) // 7
        toolBar.setItems([cancel, flexible, barButton], animated: false) // 8
        self.inputAccessoryView = toolBar // 9
    }
    @objc func tapCancel() {
        self.resignFirstResponder()
    }
}
