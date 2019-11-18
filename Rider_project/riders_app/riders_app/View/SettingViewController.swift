//
//  SettingViewController.swift
//  riders_app
//
//  Created by admin on 8/31/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnpressed(_ sender: UIButton) {
        let uina = UINavigationController.instantiateFromStoryboard(storyboardName: "Main", storyboardId: "UINavigationMainViewController")
        navigationController?.pushViewController(uina.topViewController!, animated: true)
    }


}

extension SettingViewController : FriendListViewModelProtocol {
    var aFrientList: [Friend] {
        return self.aFrientList
    }
    
    var delegate: FriendListViewModelDelegate? {
        get {
            return self.delegate
        }
        set {
            self.delegate = newValue
        }
    }
    

}
