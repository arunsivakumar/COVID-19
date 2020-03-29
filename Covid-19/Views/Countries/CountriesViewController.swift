//
//  CountriesViewController.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController {
    
    var store: CovidStore!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        store = CovidStoreImplementation()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Countries"
    }
    private func loadData() {
        store.getCountriesData { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data): self.updateUI(data: data)
            case .failure(let error): print(error)
            }
        }
    }
    
    private func updateUI(data: [CountryDataDTO]) {
        //update table view
    }
}
