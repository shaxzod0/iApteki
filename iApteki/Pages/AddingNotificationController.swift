//
//  AddingNotificationController.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 19/03/22.
//

import UIKit

class AddingNotificationController: UIViewController{
    let addButton = UIButton()
    let medicineName = UITextField()
    let dateForTake = UITextField()
    let timeForTake = UITextField()
    let datePicker = UIDatePicker()
    let timePicker = UIDatePicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initViews()
        showDatePicker()
        showTimePicker()
    }
}
extension AddingNotificationController{
    private func initViews(){
        view.addSubview(addButton)
        addButton.backgroundColor = .greenColor
        addButton.setTitle("Add notification", for: .normal)
        addButton.layer.cornerRadius = 12
        addButton.snp.makeConstraints { make in
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.7)
        }
        
        view.addSubview(medicineName)
        medicineName.placeholder = "Medicine Name"
        medicineName.layer.cornerRadius = 12
        medicineName.setLeftPaddingPoints(20)
        medicineName.backgroundColor = .white
        medicineName.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        view.addSubview(dateForTake)
        dateForTake.layer.cornerRadius = 12
        dateForTake.backgroundColor = .white
        dateForTake.setLeftPaddingPoints(20)
        dateForTake.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(medicineName.snp.bottom).offset(20)
        }
        view.addSubview(timeForTake)
        timeForTake.layer.cornerRadius = 12
        timeForTake.setLeftPaddingPoints(20)
        timeForTake.backgroundColor = .white
        timeForTake.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(dateForTake.snp.bottom).offset(20)
        }
    }
    func showTimePicker(){
        timePicker.datePickerMode = .time
        timePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTimePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style:.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        timeForTake.inputAccessoryView = toolbar
        timeForTake.inputView = timePicker
    }
    
    func showDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style:.plain, target: self, action: #selector(cancelDatePicker))
        toolbar.setItems([doneButton,spaceButton,cancelButton], animated: false)
        dateForTake.inputAccessoryView = toolbar
        dateForTake.inputView = datePicker
    }
    @objc func donedatePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        dateForTake.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    @objc func cancelDatePicker(){
        self.view.endEditing(true)
    }
    @objc func doneTimePicker(){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        timeForTake.text = formatter.string(from: timePicker.date)
        self.view.endEditing(true)
    }
}

