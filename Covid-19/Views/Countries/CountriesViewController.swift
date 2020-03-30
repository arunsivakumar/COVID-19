//
//  CountriesViewController.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class CountriesViewController: UIViewController, UISearchResultsUpdating {
    
    var store: CovidStore!
    var dataSource: CountriesDataSource?
    var countries: [CountryDataDTO] = []
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        store = CovidStoreImplementation()
        setupUI()
        loadData()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Countries"
        tableView.setDefaults()
        tableView.estimatedRowHeight = 306.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        if #available(iOS 11.0, *) {
            navigationItem.searchController = search
        } else {
            // Fallback on earlier versions
        }
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
        countries = data
        dataSource = CountriesDataSource(countries: data, photoStore: PhotoStore())
        tableView.dataSource = dataSource!
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, text != "" else {
             self.dataSource?.countries = countries
            self.tableView.reloadData()
            return
        }
         self.dataSource?.countries = dataSource?.countries.filter({ (country) -> Bool in
            country.country.lowercased().contains(text.lowercased())
         }) ?? []
        self.tableView.reloadData()
    }
}
