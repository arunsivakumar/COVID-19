//
//  ContryTableViewCell.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    
     //MARK:- Outlets
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var casesToday: UILabel!
    @IBOutlet weak var deaths: UILabel!
    @IBOutlet weak var deathsToday: UILabel!
    @IBOutlet weak var recovered: UILabel!
    @IBOutlet weak var critical: UILabel!
    @IBOutlet weak var active: UILabel!
    @IBOutlet weak var casesPerOneMillion: UILabel!
    @IBOutlet weak var deathsPerOneMillion: UILabel!

    //MARK:- Variables
    
    var country: CountryDataDTO? { didSet { updateUI() } }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        resetUI()
    }
    
    override func prepareForReuse() {
        resetUI()
    }
    
    private func setupUI() {
        flag.makeRoundedCorner()
        containerView.setupShadow()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8))
    }
    
    private func resetUI() {
        flag.image = nil
        countryLabel.text = Constants.emptyData
        cases.text = Constants.emptyData
        casesToday.text = Constants.emptyData
        deaths.text = Constants.emptyData
        deathsToday.text = Constants.emptyData
        recovered.text = Constants.emptyData
        critical.text = Constants.emptyData
        active.text = Constants.emptyData
        casesPerOneMillion.text = Constants.emptyData
        deathsPerOneMillion.text = Constants.emptyData
    }
    
    private func updateUI() {
        guard let country = country else { return }
        countryLabel.text = country.country
        cases.text = country.cases?.withCommas()
        casesToday.text = country.todayCases?.withCommas()
        deaths.text = country.deaths?.withCommas()
        deathsToday.text = country.todayDeaths?.withCommas()
        recovered.text = country.recovered?.withCommas()
        critical.text = country.critical?.withCommas()
        active.text = country.active?.withCommas()
        casesPerOneMillion.text = String(country.casesPerOneMillion ?? 0.0)
        deathsPerOneMillion.text = String(country.deathsPerOneMillion ?? 0.0)
        
    }
}
