//
//  CurrentWeather.swift
//  riders_app
//
//  Created by admin on 9/6/18.
//  Copyright © 2018 admin. All rights reserved.
//


struct CurrentWeather: Codable {
    let base: String
    let visibility: Int
    let dt: Int
    let id: Int
    let name: String
}
