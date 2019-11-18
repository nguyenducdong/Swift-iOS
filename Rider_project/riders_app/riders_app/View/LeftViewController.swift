//
//  LeftViewController.swift
//  riders_app
//
//  Created by admin on 8/30/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        
    }



}

extension LeftViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        cell.textLabel?.text = "dongnd \(indexPath.row)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 4 {
            let contentViewController = UINavigationController.instantiateFromStoryboard(storyboardName: "Main", storyboardId: "NaViSettingViewController")
            self.sideMenuController?.setContentViewController(to: contentViewController)
            self.sideMenuController?.hideMenu()
        }
        if indexPath.row == 0 {
            let contentVC = UINavigationController.instantiateFromStoryboard(storyboardName: "Main", storyboardId: "UINavigationMainViewController")
            self.sideMenuController?.setContentViewController(to: contentVC)
            self.sideMenuController?.hideMenu()
        }
        
    }
    
}
