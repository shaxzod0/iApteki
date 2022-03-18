//
//  SettingsVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class SettingsVC: UIViewController {
    let logOutButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initViews()
     }
}

extension SettingsVC{
    private func initViews(){
        view.addSubview(logOutButton)
        logOutButton.setTitle("Logout", for: .normal)
        logOutButton.layer.cornerRadius = 12
        logOutButton.backgroundColor = .greenColor
        logOutButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(55)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide).offset(-20)
        }
        logOutButton.addTarget(self, action: #selector(logOut), for: .touchUpInside)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    internal func setupNavigationBar() {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "horizontalLogo")
        if let tabBarVC = parent as? TabBarController {
            tabBarVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "notifi"), style: .done, target: self, action: #selector(goToNotification))
            tabBarVC.navigationItem.titleView = logoView
        }
    }
    @objc func goToNotification(){
        let vc = NotificationVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func logOut(){
        UserDefaultManager.shared.saveReg(reg: false)
        let vc = LoginVC()
        tabBarController?.navigationController?.navigationItem.hidesBackButton = true
        navigationController?.pushViewController(vc, animated: false)
    }
}
