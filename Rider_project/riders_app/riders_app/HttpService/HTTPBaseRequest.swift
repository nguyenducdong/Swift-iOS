//
//  HTTPBaseRequest.swift
//  riders_app
//
//  Created by admin on 9/5/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class HTTPBaseRequest: NSObject {
    
    typealias CompletionHandler = (_ data: Data?, _ error: Error?) -> Void
    
    class func requestWith(_ urlString: String,
                           httpFormat: String,
                           paramater:[String : Any]?,
                           completion: @escaping CompletionHandler) {

        
        
        if httpFormat == "GET" {
            self.GET(urlString: urlString, paramater: paramater, completion: completion)
        } else if (httpFormat == "POST") {
            self.POST(urlString: urlString, paramater: paramater, completion: completion)
        }

    }
    
    fileprivate class func GET(urlString: String,
                               paramater: [String : Any]?,
                               completion: @escaping CompletionHandler) {
        
        guard URL(string: urlString) != nil else {
            print("Error : cannot create URL from string")
            return
        }

        var urlComponent = URLComponents(string: urlString)
        
        if let paramater = paramater {
            var items = [URLQueryItem]()
            for (key, value) in paramater {
                items.append(URLQueryItem(name: key, value: value as? String))
            }
            
            items = items.filter{ $0.name.isEmpty }
            
            if !items.isEmpty {
                urlComponent?.queryItems = items
            }
        }
        
        
        var request = URLRequest(url: (urlComponent?.url)!)
        request.httpMethod = "GET"
        
        let session = URLSession.shared.dataTask(with: request) { (data, res, error) in
            guard error == nil else {
                print("error calling API")
                return completion(nil, error)
            }
            
            guard let datajson = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            
            completion(datajson,nil)
            
        }
        session.resume()
        
        
    }
    
    fileprivate class func POST(urlString: String,
                                paramater: [String : Any]?,
                                completion: @escaping CompletionHandler) {
        
        guard let url = URL(string: urlString) else {
            print("Error : cannot create URL from string")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.timeoutInterval = 60
//        JSONSerialization
        try? request.httpBody = JSONSerialization.data(withJSONObject: paramater ?? [:], options: [])
        
        let session = URLSession.shared.dataTask(with: request) { (data, res, error) in
            guard error == nil else {
                print("Error calling API")
                return completion(nil,error)
            }
            guard let dataJson = data else {
                print("Data is nil")
                return completion(nil, error)
            }
            completion(dataJson,nil)
        }
        session.resume()
        
        
        
    }

}
