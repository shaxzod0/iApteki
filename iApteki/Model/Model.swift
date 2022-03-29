//
//  Model.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import Foundation

struct IntroductionModel{
    let introductionImage: String
    let titleText: String
    let subtitleText: String
}
struct PharmacyStoresModel{
    let pharmacyName: String
    let pharmacyAddress: String
    let pharmacyLogo: String
    let pharmacyPhone: String
}

struct MedicineItemsModel{
    let pharmacyName: String
    let pharmacyAddress: String
    let pharmacyLogo: String
    let pharmacyPhone: String
    let pharmacyLong: Float
    let pharmacyLat: Float
    let medicineName: String
    let medicinePrice: Int
}



struct SharesModel{
    let shareImage: String
}
