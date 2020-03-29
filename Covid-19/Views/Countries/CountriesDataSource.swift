//
//  CountriesDataSource.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class CountriesDataSource: NSObject, UITableViewDataSource{
    
    //MARK:- Public API
    
    let countries: [CountryDataDTO]
    
    init(countries: [CountryDataDTO]) {
        self.countries = countries
    }
    
      //MARK:- DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath)  as! CountryTableViewCell
        cell.country = countries[indexPath.row]
        return cell
    }
}
