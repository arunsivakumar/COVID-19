//
//  CountryDataDTO.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

struct CountryDataDTO: Codable {
    
    struct CountryInfo: Codable {
        let _id: Int?
        let country: String?
        let iso2: String?
        let iso3: String?
        let lat: Double?
        let long: Double?
        let flag: String?
    }
    
    let country: String
    let countryInfo: CountryInfo?
    let cases: Int?
    let todayCases: Int?
    let deaths: Int?
    let todayDeaths: Int?
    let recovered: Int?
    let active: Int?
    let critical: Int?
    let casesPerOneMillion: Float?
    let deathsPerOneMillion: Float?
}

//{
//  "country": "USA",
//  "countryInfo": {
//    "_id": 840,
//    "country": "USA",
//    "iso2": "US",
//    "iso3": "USA",
//    "lat": 38,
//    "long": -97,
//    "flag": "https://raw.githubusercontent.com/NovelCOVID/API/master/assets/flags/us.png"
//  },
//  "cases": 123428,
//  "todayCases": 19302,
//  "deaths": 2211,
//  "todayDeaths": 515,
//  "recovered": 3231,
//  "active": 117986,
//  "critical": 2666,
//  "casesPerOneMillion": 373,
//  "deathsPerOneMillion": 7
//},
