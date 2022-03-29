//
//  NotificationVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class NotificationVC: UIViewController {
    let alert = UIAlertController(title: "Set notification", message: "Please write information below", preferredStyle: .alert)
    let alertdelete = UIAlertController(title: "Change", message: "Edit notification", preferredStyle: .alert)
    var datePicker: UIDatePicker = UIDatePicker()
    var notifications: [String] = []
    let tableView = UITableView()
    let toolBar = UIToolbar()
    let emptyNotifications = UILabel()
    var num = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initAlert()
        initEditAlertView()
        initTableView()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    internal func setupNavigationBar() {
        if let tabBarVC = parent as? TabBarController {
            tabBarVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add"), style: .done, target: self, action: #selector(addNotification))
        }
    }
    @objc func addNotification(){
        present(alert, animated: false, completion: nil)
    }
}


extension NotificationVC: UITableViewDelegate, UITableViewDataSource{
    private func initAlert(){
        alert.addTextField { textField in
            textField.placeholder = "Medicine name"
        }
        alert.addTextField { (dataTextField) in
            self.doDatePicker()
            dataTextField.placeholder = "Data and time"
            dataTextField.inputView = self.datePicker
            dataTextField.inputAccessoryView = self.toolBar
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Save", style: .default, handler: { save in
            let notification = self.alert.textFields?[0].text
            self.alert.textFields?[0].text = ""
            self.notifications.append(notification ?? "")
            self.emptyNotifications.isHidden = true
            self.tableView.reloadData()
        }))
    }
    func doDatePicker(){
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width:self.view.frame.size.width, height: 400))
        self.datePicker.backgroundColor = UIColor.white
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .wheels
        toolBar.barStyle = .default
        toolBar.isTranslucent = false
        toolBar.tintColor = .gray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donedatePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelDatePicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        self.toolBar.isHidden = false
        
    }
    
    
    @objc func donedatePicker(){
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
    @objc func cancelDatePicker(){
        datePicker.isHidden = true
        self.toolBar.isHidden = true
    }
    
    
    func initEditAlertView() {
        alertdelete.addTextField { textField in
            textField.placeholder = "Medicine name"
        }
        alertdelete.addAction(UIAlertAction(title: "Save", style: .default, handler: { a in
            let name = self.alertdelete.textFields?[0].text
            self.notifications[self.num] = name ?? ""
            self.tableView.reloadData()
        }))
        alertdelete.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertdelete.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { alert in
            self.notifications.remove(at: self.num)
            self.tableView.reloadData()
        }))
        
    }
    
    func presentAlert(name: String) {
        alertdelete.title = name
        alertdelete.textFields?[0].text = name
        present(alertdelete, animated: true, completion: nil)
    }
    func initTableView(){
        
        view.addSubview(emptyNotifications)
        emptyNotifications.text = "No notifications"
        emptyNotifications.isHidden = false
        emptyNotifications.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = notifications[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        num = indexPath.row
        presentAlert(name: notifications[indexPath.row])
    }
}

