//
//  WeatherRequest.swift
//  riders_app
//
//  Created by admin on 9/6/18.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

class WeatherRequest: HTTPBaseRequest {
    
    typealias WeatherObjectCompletionHandler = (_ data: CurrentWeather?, _ error: Error?) -> Void
    
    static let stubDataURL = "https://raw.githubusercontent.com/cjbatin/Swift4-Decoding-JSON-Using-Codable/master/WeatherForecast/StubData/londonWeather.json"
    class func getWeatherRequest(httpFormat: String, paramater:[String : Any]?, completion: @escaping WeatherObjectCompletionHandler) {
        HTTPBaseRequest.requestWith(stubDataURL, httpFormat: httpFormat, paramater: nil) { (data, error) in
            guard let data = data, error == nil else {
                print("Failed to get data")
                return completion(nil, error)
            }
            self.createWeatherObjectWith(data: data, completion: { (weather, error) in
                guard error == nil else {
                    return completion(nil,error)
                }
                return completion(weather,nil)
            })
        }
        
    }
    
    
    fileprivate class func createWeatherObjectWith(data: Data, completion: @escaping WeatherObjectCompletionHandler) {
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let weather = try decoder.decode(CurrentWeather.self, from: data)
            
            return completion(weather,nil)
            
        } catch let error {
            print("Error creating current weather from JSON because: \(error.localizedDescription)")
            return completion(nil, error)
        }
    }
    
    
}
