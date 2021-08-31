//
//  DatePicker.swift
//  Kings Court
//
//  Created by gwl on 25/09/20.
//  Copyright © 2020 gwl. All rights reserved.
//

import Foundation
import UIKit

typealias DatePickerHandler = (_ pickedDate: Date?) -> Void

class DatePicker: NSObject {

    static var sharedObject: DatePicker = DatePicker()

    var titleString: String? = "Select Date"
    var datePicker: UIDatePicker!
    var pickerView: UIPickerView!
    var dateComplitionBlock: DatePickerHandler?
    var maxDuration: Int = 0
    var minDuration: Int = 0
    func presentDatePicker(controller: UIViewController,
                           isForDate: Bool,
                           title: String?,
                           selectedDate: Date? = nil,
                           minimumDate: Date? = nil,
                           maximumDate: Date? = nil,
                           completionBlock : @escaping DatePickerHandler) {

        self.dateComplitionBlock = completionBlock
        self.titleString = title
        let alertView = UIAlertController(title: self.titleString,
                                          message: "\n\n\n\n\n\n\n\n\n\n\n\n",
                                          preferredStyle: UIAlertController.Style.alert)
        if datePicker == nil {
            datePicker = UIDatePicker()
        }
        datePicker.frame = CGRect(x: 10, y: 50, width: 250, height: 200)
        datePicker.datePickerMode = .date
        alertView.view.addSubview(datePicker)
        datePicker.minimumDate = minimumDate
        datePicker.maximumDate = maximumDate
        if selectedDate != nil {
            datePicker.date = selectedDate ?? Date()
        } else {
            datePicker.date = Date()
        }
        if isForDate == false {
            datePicker.datePickerMode = .time
            datePicker.tag = 1
        }
        let localPos9 = Locale.current.identifier + "_POSIX"
        datePicker.locale = Locale(identifier: localPos9)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let doneAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { _ in
            self.dateSelected(self.datePicker)
        }
        alertView.addAction(cancelAction)
        alertView.addAction(doneAction)
        controller.present(alertView, animated: true) {
            self.datePicker.frame = CGRect(x: 10, y: 52, width: (alertView.view.frame.size.width - 20), height: 200)
        }
    }
    func presentDurationPicker(controller: UIViewController,
                               date: Date?,
                               title: String?,
                               completionBlock: @escaping DatePickerHandler) {

        self.dateComplitionBlock = completionBlock
        self.titleString = title
        let alertView = UIAlertController(title: self.titleString,
                                          message: "\n\n\n\n\n\n\n\n\n\n\n\n",
                                          preferredStyle: UIAlertController.Style.alert)
        if datePicker == nil {
            datePicker = UIDatePicker()
        }

        datePicker.datePickerMode = .countDownTimer

        if date != nil {
            datePicker.date = date ?? Date()
            datePicker.minimumDate = date
        } else {
            datePicker.date = Date()
        }
        datePicker.frame = CGRect(x: 10, y: 50, width: 250, height: 200)
        alertView.view.addSubview(datePicker)
        datePicker.tag = 2
        let localPos9 = Locale.current.identifier + "_POSIX"
        datePicker.locale = Locale(identifier: localPos9)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let doneAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { _ in
            self.dateSelected(self.datePicker)
        }
        alertView.addAction(cancelAction)
        alertView.addAction(doneAction)
        controller.present(alertView, animated: true) {
            self.datePicker.frame = CGRect(x: 10, y: 52, width: (alertView.view.frame.size.width - 20), height: 200)
        }
    }
    func presentDurationPickerWithMaxDuration(controller: UIViewController,
                                              selectedDuration: Int, minDuration: Int,
                                              maxDuration: Int, completionBlock: @escaping DatePickerHandler) {
        self.dateComplitionBlock = completionBlock
        self.titleString = "Select Duration"
        let alertView = UIAlertController(title: self.titleString,
                                          message: "(Max 30 min.)\n\n\n\n\n\n\n\n\n\n\n\n\n",
                                          preferredStyle: UIAlertController.Style.alert)
        if pickerView == nil {
            pickerView = UIPickerView()
        }
        self.minDuration = minDuration
        self.maxDuration = maxDuration
        pickerView.frame = CGRect(x: 10, y: 50, width: 250, height: 200)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 5
        alertView.view.addSubview(pickerView)
        var selectedRow = 0
        if selectedDuration > 0 {
            selectedRow = selectedDuration - 1
        }
        pickerView.selectRow(selectedRow, inComponent: 0, animated: true)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil)
        let doneAction = UIAlertAction(title: "Done", style: UIAlertAction.Style.default) { _ in
            self.durationSelected(self.pickerView)
        }
        alertView.addAction(cancelAction)
        alertView.addAction(doneAction)
        controller.present(alertView, animated: true) {
            self.pickerView.frame = CGRect(x: 10, y: 52, width: (alertView.view.frame.size.width - 20), height: 200)
        }
    }
    // selected date func
    func dateSelected(_ datePicker: UIDatePicker) {
        if datePicker.tag == 5 {
            self.datePickedValueChanged(datePicker: datePicker)
        }
        let currentDate = datePicker.date
        if self.dateComplitionBlock != nil {
            self.dateComplitionBlock!(currentDate)
        }
    }
    func durationSelected(_ datePicker: UIPickerView) {
        let count = datePicker.numberOfComponents
        var min = 0
        var hour = 0
        if count == 1 {
           min = datePicker.selectedRow(inComponent: 0) + 1
        }
        if count == 2 {
            hour = datePicker.selectedRow(inComponent: 0)
            min = datePicker.selectedRow(inComponent: 1) + 1
        }
        var date = Date()
        date = setDate(hour: hour, minute: min)
        if self.dateComplitionBlock != nil {
            self.dateComplitionBlock!(date)
        }
    }
    func setDate(hour: Int, minute: Int) -> Date {
        let date = Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: Date())!
        return date
    }
    @objc func datePickedValueChanged(datePicker: UIDatePicker) {
        if datePicker.tag == 5 {
            if datePicker.countDownDuration > 1800 {
                datePicker.countDownDuration = 1800
            }
        }
    }

}
extension DatePicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if maxDuration / 60 > 1 {
            return 2
        }
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 &&  maxDuration / 60 > 1 {
            return maxDuration / 60
        }
        return maxDuration % 60
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30.0
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 &&  maxDuration / 60 > 1 {
            return row.description
        }
        return (row+1).description
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

    }
}
