//
//  FriendListViewModel.swift
//  riders_app
//
//  Created by admin on 9/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

protocol FriendListViewModelDelegate:commonDelegate {
    func refreshData()
    
}

protocol FriendListViewModelProtocol {
    var aFrientList : [Friend] {get}
    var delegate : FriendListViewModelDelegate? {get set}
}



class FriendListViewModel : FriendListViewModelProtocol {
    var aFrientList: [Friend] = [] {
        didSet{
            delegate?.refreshData()
        }
    }

    var delegate: FriendListViewModelDelegate?

    var aHttpService: HTTPService
    
    init(httpService: HTTPService = HTTPService()) {
        self.aHttpService = httpService
    }
    
    func getFriendList() {
        delegate?.showLoading(show: true)
        self.aHttpService.getFriends { (friends, error) in
            self.delegate?.showLoading(show: false)
            guard error == nil else {
                // show error
                self.delegate?.showError(error: error!)
                return
            }
            guard let friendList = friends else {
                // Array empty
                self.aFrientList = []
                return
            }
            // update data
            self.aFrientList = friendList
        }
    }
    
    func deleteFriend(id: Int) {
        delegate?.showLoading(show: true)
        self.aHttpService.deleteFriend(id: id) {
            self.getFriendList()
        }
    }
    
}
