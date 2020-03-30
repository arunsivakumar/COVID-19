//
//  ViewController.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var store: CovidStore!
    
    @IBOutlet weak var activeView: UIView!
    @IBOutlet weak var recoveredView: UIView!
    @IBOutlet weak var deathsView: UIView!
    @IBOutlet weak var casesView: UIView!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var activeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         loadData()
    }
    
    private func setupUI() {
        self.navigationItem.title = "Home"
        activeView.roundedCorner(with: Constants.corner)
        recoveredView.roundedCorner(with: Constants.corner)
        deathsView.roundedCorner(with: Constants.corner)
        casesView.roundedCorner(with: Constants.corner)
    }
    
    private func loadData() {
        store.getGlobalData { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let data): self.updateUI(data: data)
            case .failure(let error): print(error)
            }
        }
    }
    
    private func updateUI(data: GlobalDataDTO) {
        totalLabel.text = data.cases.withCommas()
        deathsLabel.text = data.deaths.withCommas()
        recoveredLabel.text = data.recovered.withCommas()
        activeLabel.text = data.active.withCommas()
    }
}
