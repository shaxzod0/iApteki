//
//  LoginVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit
import FirebaseAuth
import GoogleSignIn
import Firebase

class LoginVC: UIViewController {
    let logoImage = UIImageView()
    let subText = UILabel()
    let introductionText = UILabel()
    let phoneNumberTF = UITextField()
    let getCodeButton = UIButton()
    let signInWithGoogle = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        Auth.auth().languageCode = "uz"
        initViews()
    }
}

extension LoginVC{
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
        introductionText.text = "We will send a one time SMS message. Carrier rates may apply."
        introductionText.numberOfLines = 0
        introductionText.textAlignment = .center
        introductionText.snp.makeConstraints { make in
            make.top.equalTo(subText.snp.bottom).offset(40)
            make.left.right.equalToSuperview().inset(30)
        }
        view.addSubview(phoneNumberTF)
        phoneNumberTF.placeholder = "Enter a valid phone number"
        phoneNumberTF.backgroundColor = .white
        phoneNumberTF.layer.cornerRadius = 12
        phoneNumberTF.setLeftPaddingPoints(20)
        phoneNumberTF.keyboardType = .phonePad
        phoneNumberTF.snp.makeConstraints { make in
            make.top.equalTo(introductionText.snp.bottom).offset(20)
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerX.equalToSuperview()
        }
        view.addSubview(getCodeButton)
        getCodeButton.setTitle("Next", for: .normal)
        getCodeButton.backgroundColor = .greenColor
        getCodeButton.layer.cornerRadius = 12
        getCodeButton.addTarget(self, action: #selector(getCode), for: .touchUpInside)
        getCodeButton.snp.makeConstraints { make in
            make.top.equalTo(phoneNumberTF.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.width.equalToSuperview().multipliedBy(0.3)
        }
        view.addSubview(signInWithGoogle)
        signInWithGoogle.setTitle("Sign in", for: .normal)
        signInWithGoogle.setImage(UIImage(named: "google"), for: .normal)
        signInWithGoogle.centerTextAndImage(spacing: 10)
        signInWithGoogle.layer.cornerRadius = 12
        signInWithGoogle.backgroundColor = .greenColor
        signInWithGoogle.addTarget(self, action: #selector(signInGoogle), for: .touchUpInside)
        signInWithGoogle.snp.makeConstraints { make in
            make.top.equalTo(getCodeButton.snp.bottom).offset(20)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
        }
    }
    @objc func getCode(){
        let vc = CodeConfirmationVC()
        navigationController?.navigationBar.barTintColor = .greenColor
        navigationController?.pushViewController(vc, animated: true)
    }
    @objc func signInGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { user, error in
            if let error = error {
                print("Error: \(error)")
            }
            
            let emailAddress = user?.profile?.email
            let givenName = user?.profile?.givenName
            let profilePicture = user?.profile?.imageURL(withDimension: 320)
            
            UserDefaultManager.shared.saveName(name: givenName)
            UserDefaultManager.shared.saveAddress(address: emailAddress)
            UserDefaultManager.shared.saveProfileImage(address: profilePicture)
            
            guard let authentication = user?.authentication, let idToken = authentication.idToken else {return}
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            Auth.auth().signIn(with: credential) { result, err in
                if let error = error {
                    print("authentication error \(error.localizedDescription)")
                }
                let vc = UINavigationController(rootViewController: TabBarController())
                vc.modalPresentationStyle = .fullScreen
                vc.modalTransitionStyle = .flipHorizontal
                self.present(vc, animated: false, completion: nil)
                UserDefaultManager.shared.saveReg(reg: true)
            }
        }
        
    }
}
