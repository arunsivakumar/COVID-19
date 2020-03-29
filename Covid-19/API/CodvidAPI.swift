//
//  CodvidAPI.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import Foundation

struct CovidAPI {
    static let globalData = Resource<GlobalDataDTO>(get: URL(string: "https://corona.lmao.ninja/all")!)
}


