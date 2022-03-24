//
//  SearchItemsCell.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 24/03/22.
//

import UIKit
import SnapKit

class SearchItemsCell: UICollectionViewCell {
    let pharmacyLogo = UIImageView()
    let pharmacyName = UILabel()
    let medicinePrice = UILabel()
    let pharmacyLocation = UILabel()
    let pharmacyPhone = UILabel()
    let callButton = UIButton()
    let locationImage = UIImageView()
    let phoneImage = UIImageView()
    static let identifier = "SearchItem"
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SearchItemsCell{
    private func initViews(){
        self.addSubview(pharmacyLogo)
        self.addSubview(pharmacyName)
        self.addSubview(medicinePrice)
        self.addSubview(pharmacyLocation)
        self.addSubview(pharmacyPhone)
        self.addSubview(callButton)
        self.addSubview(locationImage)
        self.addSubview(phoneImage)
        pharmacyName.text = "Akmal farm \nDorixonasi"
        pharmacyName.numberOfLines = 0
        pharmacyName.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
        }
        pharmacyLogo.image = UIImage(named: "akmal")
        pharmacyLogo.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(100)
            make.centerY.equalTo(pharmacyName.snp.centerY)
            make.right.equalTo(pharmacyName.snp.left).inset(-20)
        }
        medicinePrice.text = "2 100 so'm"
        medicinePrice.font = .systemFont(ofSize: 30, weight: .bold)
        medicinePrice.textColor = .greenColor
        medicinePrice.snp.makeConstraints { make in
            make.top.equalTo(pharmacyName.snp.bottom).offset(50)
            make.left.equalToSuperview().inset(40)
        }
        pharmacyLocation.text = "Andijon shahar, 1 kichik daxa, 6/54"
        pharmacyLocation.numberOfLines = 0
        pharmacyLocation.textAlignment = .center
        pharmacyLocation.snp.makeConstraints { make in
            make.top.equalTo(medicinePrice.snp.bottom).offset(50)
            make.right.left.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        pharmacyPhone.text = "+998 99 999 99 99"
        pharmacyPhone.textAlignment = .center
        pharmacyPhone.snp.makeConstraints { make in
            make.top.equalTo(pharmacyLocation.snp.bottom).offset(50)
            make.right.left.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        locationImage.image = UIImage(named: "loc")
        locationImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(pharmacyLocation.snp.centerY)
            make.right.equalTo(pharmacyLocation.snp.left)
        }
        phoneImage.image = UIImage(named: "phone")
        phoneImage.snp.makeConstraints { make in
            make.width.height.equalTo(24)
            make.centerY.equalTo(pharmacyPhone.snp.centerY)
            make.right.equalTo(pharmacyPhone.snp.left)
        }
        callButton.setTitle("Call", for: .normal)
        callButton.setTitleColor(.greenColor, for: .normal)
        callButton.layer.cornerRadius = 25
        callButton.backgroundColor = .white
        callButton.layer.shadowColor = UIColor.gray.cgColor
        callButton.layer.shadowOffset = CGSize(width: 0, height: 1)
        callButton.layer.shadowOpacity = 0.9
        callButton.layer.shadowRadius = 3.0
        callButton.layer.masksToBounds = false
        callButton.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.4)
            make.height.equalTo(55)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-10)
        }
    }
}
