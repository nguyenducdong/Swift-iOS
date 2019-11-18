//
//  AddFriendViewController.swift
//  riders_app
//
//  Created by admin on 9/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol AddFriendViewControllerDelegate: class {
    func addFriendViewControllerDelegate(sender: AddFriendViewController)
}

class AddFriendViewController: UIViewController {
    
    weak var delegate : AddFriendViewControllerDelegate?
    
    var indicatorView : UIView?
    
    @IBOutlet weak var aFirstNameTxt : UITextField! {
        didSet {
            aFirstNameTxt.delegate = self
            aFirstNameTxt.addTarget(self, action: #selector(firstNameTextFieldDidChange(textfield:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var aLastNameTxt : UITextField! {
        didSet {
            aLastNameTxt.delegate = self
            aLastNameTxt.addTarget(self, action: #selector(lastNameTextFieldDidChange(textfield:)), for: .editingChanged)
        }
    }
    @IBOutlet weak var aPhoneTxt : UITextField! {
        didSet {
            aPhoneTxt.delegate = self
            aPhoneTxt.addTarget(self, action: #selector(phoneTextFieldDidChange(textfield:)), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var aSubmitbtn : UIButton! {
        didSet {
            aSubmitbtn.addTarget(self, action: #selector(submitButtonPressed(sender:)), for: .touchUpInside)
        }
    }
    
    
    var addFriendViewModel = AddFriendViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addFriendViewModel.delegate = self
        self.aSubmitbtn.isEnabled = false
        self.title = self.addFriendViewModel.aTitle
    }

    @objc
    func submitButtonPressed(sender: UIButton) {
        self.addFriendViewModel.addFriend()
    }

}

extension AddFriendViewController:  AddFriendViewModelDelegate {
    func showLoading(show: Bool) {
        if show {
            if indicatorView == nil {
                indicatorView = AddFriendViewController.displaySpinner(onView: UIApplication.shared.keyWindow)
            }
            
        } else {
            guard let indicatorView = indicatorView else {
                return
            }
            AddFriendViewController.removeSpinner(spinner: indicatorView)
            self.indicatorView = nil
        }
    }
    
    func goto() {
        delegate?.addFriendViewControllerDelegate(sender: self)
        self.navigationController?.popViewController(animated: true)
    }
    
    func enableSubmitButton(enable: Bool) {
        self.aSubmitbtn.isEnabled = enable
    }
    
    func showError(error: Error) {
        self.showAlert(title: "Error", message: "") {
            
        }
    }
    
    
}

extension AddFriendViewController {
    
    @objc
    func firstNameTextFieldDidChange(textfield: UITextField) {
        self.addFriendViewModel.aFirstName = textfield.text ?? ""
    }
    
    @objc
    func lastNameTextFieldDidChange(textfield: UITextField) {
        self.addFriendViewModel.aLastName = textfield.text ?? ""
    }
    
    @objc
    func phoneTextFieldDidChange(textfield: UITextField) {
        self.addFriendViewModel.aPhone = textfield.text ?? ""
    }
}

extension AddFriendViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
