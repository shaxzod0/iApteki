//
//  MockData.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 15/03/22.
//

import UIKit

class MockData{
    static let introductionData: [IntroductionModel] = [
        IntroductionModel(introductionImage: "first", titleText: "Find pharmacy near you", subtitleText: "It's easy to find pharmacy that is near to your location. With just one tap."),
        IntroductionModel(introductionImage: "second", titleText: "Search with our database", subtitleText: "It's easy to find pharmacy that is near to your location. With just one tap."),
        IntroductionModel(introductionImage: "third", titleText: "Get medicine on time", subtitleText: "Set reminder and it will send notification about getting medicine")
    ]
    static let pharmaciesData: [PharmacyStoresModel] = [
        PharmacyStoresModel(pharmacyName: "Akmal pharm", pharmacyAddress: "Andijon shaxar, 1-kichik daxa", pharmacyLogo: "akmal", pharmacyPhone: "+998 99 123 12 12"),
        PharmacyStoresModel(pharmacyName: "Safo farm", pharmacyAddress: "Andijon shaxar, 3-kichik daxa", pharmacyLogo: "safo", pharmacyPhone: "+998 99 123 12 12"),
        PharmacyStoresModel(pharmacyName: "Akmal pharm", pharmacyAddress: "Andijon shaxar, 1-kichik daxa", pharmacyLogo: "akmal", pharmacyPhone: "+998 99 123 12 12"),
    ]
    static let sharesData: [SharesModel] = [
        SharesModel(shareImage: "1"),
        SharesModel(shareImage: "2")
    ]
    static let medicineData: [MedicineItemsModel] = [
        MedicineItemsModel(pharmacyName: "Safo pharm", pharmacyAddress: "Yangi bozor", pharmacyLogo: "safo", pharmacyPhone: "+9981231232", pharmacyLong:72.346873, pharmacyLat: 40.785302, medicineName: "Trimol", medicinePrice: 7000),
        MedicineItemsModel(pharmacyName: "Akmal Farm \n Medical - 1", pharmacyAddress: "1 kichik daha", pharmacyLogo: "akmal", pharmacyPhone: "+998782980088", pharmacyLong: 72.336360, pharmacyLat: 40.743941, medicineName: "Sitramon", medicinePrice: 7500),
        MedicineItemsModel(pharmacyName: "Gulnora farm", pharmacyAddress: "Yangi bozor", pharmacyLogo: "gulnora", pharmacyPhone: "+998782980088", pharmacyLong: 72.352984, pharmacyLat: 40.759396, medicineName: "Trimol", medicinePrice: 8000)
    ]
}
