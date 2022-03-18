//
//  SearchVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class SearchVC: UIViewController {
    let searchTF = UITextField()
    weak var collectionView: UICollectionView?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initViews()
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
}

extension SearchVC{
    private func initViews(){
        view.addSubview(searchTF)
        searchTF.placeholder = "Search for medicine"
        searchTF.backgroundColor = .white
        searchTF.layer.cornerRadius = 12
        searchTF.setLeftView(image: UIImage(named: "search-sel")!)
        searchTF.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        let segmentItems = ["Available", "Nearest"]
        let searchSegmentController = UISegmentedControl(items: segmentItems)
        view.addSubview(searchSegmentController)
        searchSegmentController.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchTF.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        
        
    }
}
