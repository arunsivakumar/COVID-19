//
//  GlobalData.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

struct GlobalDataDTO: Codable {
    let cases: Int
    let deaths: Int
    let recovered: Int
    let updated: Int
    let active: Int
}

struct CountryDataDTO: Codable {
    
    struct countryInfo: Codable {
        let _id: String
        let country: String
        let iso2: String
        let iso3: String
        let lat: Int
        let long: Int
        let flag: String
    }
    
    let country: String
    let countryInfo: countryInfo
    let cases: Int
    let todayCases: Int
    let deaths: Int
    let todayDeaths: Int
    let recovered: Int
    let active: Int
    let critical: Int
    let casesPerOneMillion: Int
    let deathsPerOneMillion: Int
}
