//
//  PharmaciesCell.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class PharmaciesCell: UICollectionViewCell {
    let pharmacyLogo = UIImageView()
    let pharmacyName = UILabel()
    let pharmacyAddress = UILabel()
    let pharmacyPhone = UILabel()
    let phoneLogo = UIImageView()
    static let identifier = "pharmacies"
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension PharmaciesCell{
    private func initViews(){
        self.addSubview(pharmacyLogo)
        self.addSubview(pharmacyName)
        self.addSubview(pharmacyAddress)
        self.addSubview(pharmacyPhone)
        self.addSubview(phoneLogo)
        self.layer.cornerRadius = 12
        self.backgroundColor = .white
        
        phoneLogo.image = UIImage(named: "phone")
        
        pharmacyName.text = "Akmalpharm"
        pharmacyLogo.image = UIImage(named: "akmal")
        pharmacyLogo.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(80)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().inset(20)
        }
        pharmacyName.text = "Akmal pharm"
        pharmacyName.numberOfLines = 0
        pharmacyName.font = .systemFont(ofSize: 20, weight: .bold)
        pharmacyName.snp.makeConstraints { make in
            make.left.equalTo(pharmacyLogo.snp.right).inset(-20)
            make.top.equalTo(pharmacyLogo.snp.top)
            make.right.equalToSuperview().inset(10)
        }
 
        pharmacyAddress.text = "Address"
        pharmacyAddress.font = .systemFont(ofSize: 14, weight: .regular)
        pharmacyAddress.numberOfLines = 0
        pharmacyAddress.snp.makeConstraints { make in
            make.top.equalTo(pharmacyName.snp.bottom).offset(20)
            make.left.equalTo(pharmacyLogo.snp.right).inset(-20)
            make.right.equalToSuperview().inset(10)
        }

        
        pharmacyPhone.text = "+998 99 999 99 99"
        pharmacyPhone.textColor = .greenColor
        pharmacyPhone.font = .systemFont(ofSize: 16, weight: .bold)
        pharmacyPhone.snp.makeConstraints { make in
            make.top.equalTo(pharmacyAddress.snp.bottom).offset(10)
            make.left.equalTo(pharmacyLogo.snp.right).inset(-40)
            make.right.equalToSuperview().inset(10)
        }
        phoneLogo.snp.makeConstraints { make in
            make.centerY.equalTo(pharmacyPhone.snp.centerY)
            make.left.equalTo(pharmacyLogo.snp.right).inset(-20)
            make.width.height.equalTo(10)
        }
    }
    func setItems(item: PharmacyStoresModel){
        pharmacyLogo.image = UIImage(named: item.pharmacyLogo)
        pharmacyPhone.text = item.pharmacyPhone
        pharmacyAddress.text = item.pharmacyAddress
        pharmacyName.text = item.pharmacyName
    }
}
