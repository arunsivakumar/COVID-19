//
//  About.swift
//  Covid-19
//
//  Created by Arun Sivakumar on 30/3/20.
//  Copyright © 2020 Arun Sivakumar. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    @IBAction func openAPILink(_ sender: Any) {
        let url = "https://github.com/novelcovid/api"
        open(url: url)
    }
    
    @IBAction func openPrivacyPolicy(_ sender: Any) {
        let url = "https://github.com/arunsivakumar/COVID-19/blob/master/Covid-19/PrivacyPolicy.md"
        open(url: url)
    }
    
    @IBAction func openTermsAndConditions(_ sender: Any) {
        let url = "https://github.com/arunsivakumar/COVID-19/blob/master/Covid-19/Terms%26Conditions.md"
        open(url: url)
    }
    
    private func open(url: String) {
        if let urlLink = URL(string: url) {
            UIApplication.shared.open(urlLink)
        }
    }
    
}
