//
//  HTTPService.swift
//  riders_app
//
//  Created by admin on 9/7/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation

import Alamofire

class HTTPService {
    
    typealias GetFriendComplete = (_ result: [Friend]?, _ error: Error?) -> Void
    
    func getFriends(completion: @escaping GetFriendComplete) {
        Alamofire.request("http://friendservice.herokuapp.com/listFriends")
            .validate()
            .responseJSON { (response) in
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        completion(nil,response.error)
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        decoder.keyDecodingStrategy = .convertFromSnakeCase
                        let friend = try decoder.decode([Friend].self, from: data)
                        completion(friend,nil)
                    } catch let error {
                        completion(nil, error)
                    }
                    break
                case .failure(let err):
                    completion(nil, err)
                    break
                }
        }

    }
    
    
    typealias DeleteFriendCompletion = () -> Void
    
    func deleteFriend(id: Int, completion: @escaping DeleteFriendCompletion) {
        Alamofire.request("https://friendservice.herokuapp.com/editFriend/\(id)", method: .delete, parameters: nil, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion()
                case .failure(_):
                    completion()
                }
        }
    }
    
    
    
    typealias PostFriendCompletion = (_ success: Bool, _ error:Error?) -> Void
    
    func postFriend(firstname: String, lastname: String, phonenumber: String, completion: @escaping PostFriendCompletion) {
        let param = ["firstname": firstname,
                     "lastname": lastname,
                     "phonenumber": phonenumber]
        Alamofire.request("https://friendservice.herokuapp.com/addFriend", method: .post, parameters: param, encoding: JSONEncoding.default)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success:
                    completion(true,nil)
                case .failure(let error):
                    completion(false, error)
                }
        }
    }
    
}
