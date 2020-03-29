//
//  CovidStore.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case networking
    case cache
}

typealias GlobalDataCompletion =  (Result<GlobalDataDTO, Error>) -> Void
typealias CountriesDataCompletion =  (Result<[CountryDataDTO], Error>) -> Void


protocol CovidStore {
    func getGlobalData(completion: @escaping GlobalDataCompletion)
    func getCountriesData(completion: @escaping CountriesDataCompletion)
}

class CovidStoreImplementation: CovidStore {
    
    func getGlobalData(completion: @escaping GlobalDataCompletion) {
        URLSession.shared.load(CovidAPI.globalData) { (data) in
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(CustomError.networking))
            }
        }
    }
    
    func getCountriesData(completion: @escaping CountriesDataCompletion) {
        URLSession.shared.load(CovidAPI.countriesData) { (data) in
            if let data = data {
                completion(.success(data))
            } else {
                completion(.failure(CustomError.networking))
            }
        }
    }
}
