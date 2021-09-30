//
//  RatesListViewController.swift
//  CryptoView
//
//  Created by Василий Пронин on 28.09.2021.
//

import UIKit

class RatesListViewController: UITableViewController {
    
    var currencies: [CurrenciesTicker] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
        navigationItem.title = "Watchlist"
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        currencies.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "rateCell", for: indexPath) as! RateCell
        let rate = currencies[indexPath.row]
        cell.configure(with: rate)

        return cell
    }
    
    private func fetchData() {
        NetworkManager.shared.fetch(dataType: [CurrenciesTicker].self, from: Link.currencies.rawValue) { result in
            switch result {
            case .success(let rates):
                self.currencies = rates
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
