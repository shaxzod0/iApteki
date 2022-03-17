//
//  UserDefaultManager.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit

class UserDefaultManager{
    let defaults = UserDefaults.standard
    let authKey = "authentication"
    let phoneKey = "phone"
    let nameKey = "name"
    let addressKey = "address"
    let pictureUrl = "picture"
    
    static let shared = UserDefaultManager()
    func saveReg(reg: Bool?){
        defaults.set(reg, forKey: authKey)
    }
    func checkReg()->Bool{
        return defaults.bool(forKey: authKey)
    }
    
    func saveName(name: String?){
        defaults.set(name, forKey: nameKey)
    }
    func getName()->String{
        return defaults.string(forKey: nameKey) ?? "User"
    }
    
    func saveAddress(address: String?){
        defaults.set(address, forKey: addressKey)
    }
    func getAddress()->String{
        return defaults.string(forKey: addressKey) ?? "example@gmail.com"
    }
    
    func saveProfileImage(address: URL?){
        defaults.set(address, forKey: pictureUrl)
    }
    func getProfileImage()->URL{
        return defaults.url(forKey: pictureUrl) ?? URL(string: "https://picsum.photos/200")!
    }

}
