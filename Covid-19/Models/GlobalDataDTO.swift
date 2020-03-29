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
