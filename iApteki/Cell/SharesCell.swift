//
//  SheresCell.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class SharesCell: UICollectionViewCell {
    let sharesImage = UIImageView()
    static let identifier = "sharesCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SharesCell{
    private func initViews(){
        self.addSubview(sharesImage)
        sharesImage.image = UIImage(named: "akmal")
        sharesImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    func setItems(item: SharesModel){
        sharesImage.image = UIImage(named: item.shareImage)
    }
}
