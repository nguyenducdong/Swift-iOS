//
//  FriendListViewController.swift
//  riders_app
//
//  Created by admin on 9/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class FriendListViewController: UIViewController {
    
    let aFriendListViewModel = FriendListViewModel()
    var activityIndicator : UIView?
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.aFriendListViewModel.delegate = self
        self.aFriendListViewModel.getFriendList()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addFriend" {
            let vc = segue.destination as! AddFriendViewController
            vc.delegate = self
        }
    }
}

extension FriendListViewController : AddFriendViewControllerDelegate {
    func addFriendViewControllerDelegate(sender: AddFriendViewController) {
        self.aFriendListViewModel.getFriendList()
    }
}

extension FriendListViewController : FriendListViewModelDelegate {
    func showLoading(show: Bool) {
        if show {
            if activityIndicator == nil {
                activityIndicator = FriendListViewController.displaySpinner(onView: UIApplication.shared.keyWindow)
            }
        } else {
            guard let indicatorView = activityIndicator else {
                return
            }
            FriendListViewController.removeSpinner(spinner: indicatorView)
            activityIndicator = nil
        }
    }
    
    func refreshData() {
        self.tableView.reloadData()
    }
    
    func showError(error: Error) {
        self.showAlert(title: "Error", message: "Internet not avalable") {
            
        }
    }
    
    
}


extension FriendListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.aFriendListViewModel.aFrientList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cellID")
        cell.textLabel?.text = self.aFriendListViewModel.aFrientList[indexPath.row].firstname
        return cell
    }
    
}

extension FriendListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.aFriendListViewModel.deleteFriend(id: self.aFriendListViewModel.aFrientList[indexPath.row].id)
        }
    }
}
