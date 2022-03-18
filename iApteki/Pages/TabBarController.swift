//
//  TabBarController.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit
import SOTabBar

class TabBarController: SOTabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        let searchVC = SearchVC()
        let notificationVC = NotificationVC()
        let settingsVC = SettingsVC()
        let mainVC = MainVC()
        
        mainVC.tabBarItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu"), selectedImage: UIImage(named: "menu-sel"))
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(named: "search"), selectedImage: UIImage(named: "search-sel"))
        notificationVC.tabBarItem = UITabBarItem(title: "Notification", image: UIImage(named: "not"), selectedImage: UIImage(named: "not-sel"))
        settingsVC.tabBarItem = UITabBarItem(title: "settings", image: UIImage(named: "set"), selectedImage: UIImage(named: "set-sel"))
        viewControllers = [mainVC,searchVC,notificationVC,settingsVC]
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        initNavigationView()
    }
    override func loadView() {
        super.loadView()
        SOTabBarSetting.tabBarTintColor = UIColor.backgroundColor
        SOTabBarSetting.tabBarBackground = .white
    }
}

extension TabBarController: SOTabBarControllerDelegate{
    func tabBarController(_ tabBarController: SOTabBarController, didSelect viewController: UIViewController) {
        return
    }
    
    func initNavigationView(){
        let logoView = UIImageView()
        logoView.image = UIImage(named: "horizontalLogo")
        let rightCart = UIBarButtonItem(image: UIImage(named: "notifi"), style: .done, target: self, action: #selector(goToNotification))
        navigationItem.rightBarButtonItem = rightCart
        navigationItem.titleView = logoView
    }
    @objc func goToNotification(){
        let vc = NotificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
}
