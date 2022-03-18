//
//  NotificationVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
 
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tabBarController?.navigationController?.navigationItem.setRightBarButton(nil, animated: false)
        self.tabBarController?.navigationController?.navigationBar.isTranslucent = false

    }
    
    internal func setupNavigationBar() {
        title = "Notification list"
        if let tabBarVC = parent as? TabBarController {
            tabBarVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "add"), style: .done, target: self, action: #selector(addNotification))
        }
    }
    @objc func addNotification(){
        return
    }
}
