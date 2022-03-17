//
//  NotificationVC.swift
//  iApteki
//
//  Created by Shaxzod Azamatjonov on 17/03/22.
//

import UIKit

class NotificationVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .backgroundColor
        let addNotification = UIBarButtonItem(image: UIImage(named: "add"), style: .done, target: self, action: #selector(addNotification))
        tabBarController?.navigationItem.rightBarButtonItem = addNotification
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        let addNotification = UIBarButtonItem(image: UIImage(named: "add"), style: .done, target: self, action: #selector(addNotification))
        tabBarController?.navigationItem.rightBarButtonItem = addNotification
    }
    @objc func addNotification(){
        return
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
