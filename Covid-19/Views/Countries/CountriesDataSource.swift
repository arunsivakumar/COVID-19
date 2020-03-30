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
    let photoStore: PhotoStore
    
    init(countries: [CountryDataDTO], photoStore: PhotoStore) {
        self.countries = countries
        self.photoStore = photoStore
    }
    
    //MARK:- DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell", for: indexPath)  as! CountryTableViewCell
        let country = countries[indexPath.row]
        cell.country = country
        if let flag = country.countryInfo?.flag {
            photoStore.fetchImage(for: flag) { [weak self] (result) in
                guard case let .success(image) = result else { return }
                cell.flag.image = image
            }
        }
        return cell
    }
}
