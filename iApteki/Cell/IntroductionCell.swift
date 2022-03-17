//
//  IntroductionCell.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit

class IntroductionCell: UICollectionViewCell {
    let imageView = UIImageView()
    let titleText = UILabel()
    let subtitleText = UILabel()
    static let identifier = "introductionCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension IntroductionCell{
    private func initViews(){
        self.addSubview(imageView)
        self.addSubview(titleText)
        self.addSubview(subtitleText)
        imageView.image = UIImage(named: "first")
        imageView.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.35)
            make.height.equalToSuperview().multipliedBy(0.28)
            make.top.equalToSuperview().offset(40)
            make.left.equalToSuperview().inset(40)
        }
        titleText.text = "Some text"
        titleText.font = .systemFont(ofSize: 50, weight: .bold)
        titleText.numberOfLines = 0
        titleText.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(30)
        }
        subtitleText.text = "Some text"
        subtitleText.numberOfLines = 0
        subtitleText.font = .systemFont(ofSize: 25, weight: .regular)
        subtitleText.snp.makeConstraints { make in
            make.top.equalTo(titleText.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
        }
    }
    func setItems(item: IntroductionModel){
        imageView.image = UIImage(named: item.introductionImage)
        titleText.text = item.titleText
        subtitleText.text = item.subtitleText
    }
}
