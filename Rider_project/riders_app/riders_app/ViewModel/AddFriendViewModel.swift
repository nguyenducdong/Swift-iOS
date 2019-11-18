//
//  AddFriendViewModel.swift
//  riders_app
//
//  Created by admin on 9/7/18.
//  Copyright © 2018 admin. All rights reserved.
//


protocol AddFriendViewModelDelegate:commonDelegate {
    
    func goto()
    func enableSubmitButton(enable: Bool)
    
}

protocol AddFriendViewModelProtocol {
    var aTitle: String {get}
    var aFirstName: String? {get set}
    var aLastName: String? {get set}
    var aPhone: String? {get set}
    var delegate: AddFriendViewModelDelegate? {get set}
}



class AddFriendViewModel : AddFriendViewModelProtocol {
    var aTitle: String {
        return "Add Friend"
    }
    
    var aFirstName: String? {
        didSet {
            delegate?.enableSubmitButton(enable: self.validateInput())
        }
    }
    
    var aLastName: String? {
        didSet {
            delegate?.enableSubmitButton(enable: self.validateInput())
        }
    }
    
    var aPhone: String? {
        didSet {
            delegate?.enableSubmitButton(enable: self.validateInput())
        }
    }
    
    var delegate: AddFriendViewModelDelegate?
    
    var aHttpService: HTTPService
    
    init(httpService: HTTPService = HTTPService()) {
        self.aHttpService = httpService
    }
    
    func addFriend() {
        
        guard let firstname = aFirstName,
            let lastname = aLastName,
            let phone = aPhone else {
            return
        }
        
        delegate?.showLoading(show: true)
        self.aHttpService.postFriend(firstname: firstname, lastname: lastname, phonenumber: phone) { success, error in
            self.delegate?.showLoading(show: false)
            if success {
                self.delegate?.goto()
            } else {
                self.delegate?.showError(error: error!)
            }
            
        }
    }
    
    
    func validateInput() -> Bool {
        guard let firstname = aFirstName, firstname.count > 0,
            let lastname = aLastName, lastname.count > 0,
            let phone =  aPhone, phone.count > 0 else {
            return false
        }
        return true
    }

}
