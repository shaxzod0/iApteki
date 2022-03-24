//
//  SettingsVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class SettingsVC: UIViewController {
    let logOutButton = UIButton()
    let restView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initViews()
    }
}

extension SettingsVC{
    private func initViews(){
        view.addSubview(restView)
        restView.backgroundColor = .white
        restView.layer.cornerRadius = 12
        restView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.4)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.9)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
    internal func setupNavigationBar() {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "horizontalLogo")
        if let tabBarVC = parent as? TabBarController {
            tabBarVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"), style: .done, target: self, action: #selector(goToNotification))
            tabBarVC.navigationItem.titleView = logoView
        }
    }
    @objc func goToNotification(){
        showAlert()
    }
    func showAlert() {
        let alert = UIAlertController(title: "Are you sure?", message: "You really want log out", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { alert in
            self.dismiss(animated: false)
        }))
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: { alert in
            self.loginVC()
            UserDefaultManager.shared.saveReg(reg: false)
        }))
        present(alert, animated: true)
    }
    func loginVC() {
        let vc = LoginVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: false, completion: nil)
    }
}
