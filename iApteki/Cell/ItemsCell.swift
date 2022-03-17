//
//  ItemsCell.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class ItemsCell: UICollectionViewCell {
    let pharmacyLogo = UIImageView()
    let pharmacyName = UILabel()
    let priceOfItem = UILabel()
    let pharmacyAddress = UILabel()
    let pharmacyPhone = UILabel()
    let locationLogo = UIImageView()
    let phoneLogo = UIImageView()
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ItemsCell{
    private func initViews(){
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        self.addSubview(pharmacyLogo)
        self.addSubview(pharmacyName)
        self.addSubview(priceOfItem)
        self.addSubview(pharmacyAddress)
        self.addSubview(pharmacyPhone)
        self.addSubview(locationLogo)
        self.addSubview(phoneLogo)
    }
}
