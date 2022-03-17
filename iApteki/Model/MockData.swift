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
    PharmacyStoresModel(pharmacyName: "Akmal pharm", pharmacyAddress: "Andijon shaxar, 1-kichik daxa", pharmacyLogo: "akmal", pharmacyPhone: "+998 99 123 12 12"),
    PharmacyStoresModel(pharmacyName: "Akmal pharm", pharmacyAddress: "Andijon shaxar, 1-kichik daxa", pharmacyLogo: "akmal", pharmacyPhone: "+998 99 123 12 12"),
    ]
    static let sharesData: [SharesModel] = [
    SharesModel(shareImage: "carousel"),
    SharesModel(shareImage: "carousel"),
    SharesModel(shareImage: "carousel")
    ]
}
