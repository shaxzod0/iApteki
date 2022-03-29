//
//  SearchVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit
import MapKit


class SearchVC: UIViewController {
    let searchTF = UITextField()
    weak var collectionView: UICollectionView?
    let locationManager = CLLocationManager()
    var locationParam = ""
    let data = MockData.medicineData
    
    var medicineList: [MedicineItemsModel] = []
    var searchedMedicine: [MedicineItemsModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        searchedMedicine = data
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        initViews()
        locationManagerAuthorize()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }
}
// MARK: UI
extension SearchVC: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource, getPhoneNumberProtocol{
    func getPhoneNumber(_ number: String) {
        guard let url = URL(string: "telprompt://\(number)"),
                UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
    
    private func initViews(){
        view.addSubview(searchTF)
        searchTF.placeholder = "Search for medicine"
        searchTF.backgroundColor = .white
        searchTF.layer.cornerRadius = 12
        searchTF.delegate = self
        searchTF.autocorrectionType = .no
        searchTF.clearButtonMode = .whileEditing
        searchTF.returnKeyType = .search
        searchTF.setLeftView(image: UIImage(named: "search-sel")!)
        searchTF.snp.makeConstraints { make in
            make.width.equalToSuperview().multipliedBy(0.9)
            make.centerX.equalToSuperview()
            make.height.equalTo(55)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
        }
        let segmentItems = ["Available", "Nearest"]
        let searchSegmentController = UISegmentedControl(items: segmentItems)
        view.addSubview(searchSegmentController)
        searchSegmentController.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(searchTF.snp.bottom).offset(10)
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(40)
        }
        let l = UICollectionViewFlowLayout()
        l.minimumInteritemSpacing = 15
        l.minimumLineSpacing = 15
        l.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: l)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SearchItemsCell.self, forCellWithReuseIdentifier: SearchItemsCell.identifier)
        view.addSubview(collectionView)
        collectionView.backgroundColor = .clear
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchSegmentController.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.view.safeAreaLayoutGuide)
        }
        self.collectionView = collectionView
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedMedicine.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchItemsCell.identifier, for: indexPath) as! SearchItemsCell
        cell.delegate = self
        cell.setItems(item: searchedMedicine[indexPath.item])
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width - 20
        return CGSize(width: width, height: 450)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    internal func setupNavigationBar() {
        let logoView = UIImageView()
        logoView.image = UIImage(named: "horizontalLogo")
        if let tabBarVC = parent as? TabBarController {
            tabBarVC.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "loc"), style: .done, target: self, action: #selector(getLocation))
            tabBarVC.navigationItem.titleView = logoView
        }
    }
 
}

// MARK: Location
extension SearchVC: CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            locationParam = "\(lat),\(lon)"
            print(locationParam)
            locationManager.stopUpdatingLocation()
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    func locationManagerAuthorize(){
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled(){
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
    }
    @objc func getLocation(){
        locationManager.startUpdatingLocation()
    }
}


extension SearchVC: UITextFieldDelegate{
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        searchTF.resignFirstResponder()
        self.searchedMedicine.removeAll()
        for str in medicineList{
            searchedMedicine.append(str)
            print(str)
        }
        return true
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if searchTF.text?.count != 0{
            self.searchedMedicine.removeAll()
            for str in data{
                let range = str.medicineName.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil, locale: nil)
                if range != nil{
                    self.searchedMedicine.append(str)
                }
            }
        } else {
            searchedMedicine = data
        }
        collectionView?.reloadData()
        return true
    }
}
