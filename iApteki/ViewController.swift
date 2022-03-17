//
//  ViewController.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    let backgroundImage = UIImageView()
    weak var collectionView: UICollectionView?
    let data = MockData.introductionData
    let startButton = UIButton()
    let swipeLabel = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initViews()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    private func initViews(){
        view.addSubview(startButton)
        view.bringSubviewToFront(startButton)
        view.addSubview(swipeLabel)
        swipeLabel.text = "swipe"
        swipeLabel.textColor = .greenColor.withAlphaComponent(0.7)
        swipeLabel.textAlignment = .center
        swipeLabel.isHidden = false
        swipeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.right.left.equalToSuperview()
        }
        startButton.setTitle("Get started", for: .normal)
        startButton.backgroundColor = .greenColor
        startButton.layer.cornerRadius = 15
        startButton.isHidden = true
        startButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        startButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(50)
            make.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().offset(-10)
        }
        
        let l = UICollectionViewFlowLayout()
        l.scrollDirection = .horizontal
        l.minimumLineSpacing = 0
        l.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: l)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.backgroundColor = .clear
        collectionView.register(IntroductionCell.self, forCellWithReuseIdentifier: IntroductionCell.identifier)
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(startButton.snp.top)
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: IntroductionCell.identifier, for: indexPath) as! IntroductionCell
        cell.setItems(item: data[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.item == data.count - 1{
            swipeLabel.isHidden = true
            startButton.isHidden = false
        }else{
            swipeLabel.isHidden = false
            startButton.isHidden = true
        }
    }
    @objc func goToLogin(){
        let vc = UINavigationController(rootViewController: LoginVC())
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}

