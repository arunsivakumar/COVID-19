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
    var dataSource: CountriesDataSource?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        store = CovidStoreImplementation()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Countries"
        tableView.estimatedRowHeight = 300.0
        tableView.rowHeight = UITableView.automaticDimension
        
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
        dataSource = CountriesDataSource(countries: data, photoStore: PhotoStore())
        tableView.dataSource = dataSource!
        tableView.reloadData()
    }
}
