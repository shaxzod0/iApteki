//
//  PharmaciesSharesHeader.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import AnimatedCollectionViewLayout
import UIKit

class PharmaciesSharesHeader: UICollectionReusableView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let titleLabel = UILabel()
    let showLabel = UILabel()
    let lineOne = UIView()
    let lineTwo = UIView()
    
    var item = 0
    
    let carouselData = MockData.sharesData
    var scrollingTimer = Timer()
    weak var collectionView: UICollectionView?
    
    static let identifier = "hit"
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initViews() {
        self.addSubview(titleLabel)
        self.addSubview(showLabel)
        
        let l = AnimatedCollectionViewLayout()
        l.animator = LinearCardAttributesAnimator(minAlpha: 0.2, itemSpacing: 0.3, scaleRate: 0.8)
        l.minimumLineSpacing = 0
        l.minimumInteritemSpacing = 0
        l.scrollDirection = .horizontal
        let carouselCollectionView =  UICollectionView(frame: .zero, collectionViewLayout: l)
        self.addSubview(carouselCollectionView)
        carouselCollectionView.isPagingEnabled = true
        carouselCollectionView.showsHorizontalScrollIndicator = false
        carouselCollectionView.backgroundColor = .clear
        carouselCollectionView.translatesAutoresizingMaskIntoConstraints = false
        carouselCollectionView.register(SharesCell.self, forCellWithReuseIdentifier: SharesCell.identifier)
        carouselCollectionView.delegate = self
        carouselCollectionView.dataSource = self
        carouselCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.width.equalToSuperview()
            make.height.equalTo(200)
        }
        self.collectionView = carouselCollectionView
        
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.text = "Top pharmacies"
        titleLabel.textColor = .greenColor
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(carouselCollectionView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
        }
        self.addSubview(lineOne)
        self.addSubview(lineTwo)
        
        lineOne.backgroundColor = .greenColor
        lineOne.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(3)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.right.equalTo(titleLabel.snp.left).inset(-10)
        }
        lineTwo.backgroundColor = .greenColor
        lineTwo.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.2)
            make.height.equalTo(3)
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.left.equalTo(titleLabel.snp.right).inset(-10)
        }
        
        
        scrollingTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(startTimer), userInfo: nil, repeats: true)
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carouselData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SharesCell.identifier, for: indexPath) as! SharesCell
        cell.setItems(item: carouselData[indexPath.item])
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
    }
    
    @objc func startTimer(){
        if item >= carouselData.count - 1{
            item = 0
            collectionView?.scrollToItem(at: IndexPath(item: item, section: 0), at: .centeredHorizontally, animated: true)
            return
        } else {
            item += 1
        }
        
        let cellSize = CGSize(width: (collectionView?.frame.width)!, height: 200)
        let contentOffset = collectionView?.contentOffset
        collectionView?.scrollRectToVisible(CGRect(x: contentOffset!.x + cellSize.width, y: contentOffset!.y, width: cellSize.width, height: cellSize.height), animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        item = indexPath.item
    }
    
    
}
