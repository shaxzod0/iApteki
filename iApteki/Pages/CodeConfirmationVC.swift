//
//  CodeConfirmationVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit

class CodeConfirmationVC: UIViewController, UITextFieldDelegate {
    let logoImage = UIImageView()
    let subText = UILabel()
    let introductionText = UILabel()
    let phoneNumberTF = UITextField()
    let verifyButtom = UIButton()
    var verificationId: String?
    var indicator = 0
    var textFieldBank: [UITextField] = []
    let stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        initViews()
    }
}

extension CodeConfirmationVC{
    private func initViews(){
        view.addSubview(logoImage)
        logoImage.image = UIImage(named: "logo")
        logoImage.snp.makeConstraints { make in
            make.height.equalTo(125)
            make.width.equalTo(107)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(50)
        }
        view.addSubview(subText)
        subText.text = "Health first"
        subText.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom)
            make.centerX.equalToSuperview()
        }
        view.addSubview(introductionText)
        introductionText.text = "Submit the 6 digit code you got on your provided number."
        introductionText.numberOfLines = 0
        introductionText.textAlignment = .center
        introductionText.snp.makeConstraints { make in
            make.top.equalTo(subText.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(30)
        }
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.backgroundColor = .clear
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalTo(introductionText.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(80)
        }
        for index in 0..<6 {
            let tf = UITextField()
            tf.backgroundColor = .white
            tf.font = .systemFont(ofSize: 34, weight: .bold)
            tf.layer.cornerRadius = 6
            tf.placeholder = "_"
            tf.textAlignment = .center
            tf.delegate = self
            tf.tag = index
            stackView.addArrangedSubview(tf)
            textFieldBank.append(tf)
            
        }
        textFieldBank[indicator].becomeFirstResponder()
        view.addSubview(verifyButtom)
        verifyButtom.setTitle("Verify", for: .normal)
        verifyButtom.backgroundColor = .greenColor
        verifyButtom.layer.cornerRadius = 12
        verifyButtom.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        verifyButtom.addTarget(self, action: #selector(getConfirm), for: .touchUpInside)
    }
    @objc func getConfirm(){
        let vc = TabBarController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
