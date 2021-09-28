//
//  RateCell.swift
//  CryptoView
//
//  Created by Василий Пронин on 28.09.2021.
//

import UIKit

class RateCell: UITableViewCell {
    
    @IBOutlet var currencyLogo: UIImageView!
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var exchangeRateLabel: UILabel!
    @IBOutlet var priceChangeLabel: UILabel!
    @IBOutlet var priceChangePercentLabel: UILabel!
    
    func configure(with currency: CurrenciesTicker?) {
        if let currency = currency?.id {
            idLabel.text = currency + "USD"
        }
        
        if let currency = currency?.name {
            nameLabel.text = currency + " / " + "U.S. Dollar"
        }
    
        exchangeRateLabel.text = format(currency?.price)
        
        if currency?.oneDay?.priceChange?.first == "+" {
            priceChangeLabel.textColor = .systemGreen
            priceChangePercentLabel.textColor = .systemGreen
        } else if currency?.oneDay?.priceChange?.first == "-" {
            priceChangeLabel.textColor = .systemRed
            priceChangePercentLabel.textColor = .systemRed
        }
        
        priceChangeLabel.text = format(currency?.oneDay?.priceChange)
        priceChangePercentLabel.text = format(currency?.oneDay?.priceChangePct)
        
        NetworkManager.shared.fetchImage(from: currency?.logoUrl) { result in
            switch result {
            case .success(let imageData):
                self.currencyLogo.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func format(_ string: String?) -> String? {
        guard let string = string else {
            return nil
        }
        let newString = (string as NSString).floatValue
        let formatted = String(format: "%.2f", newString)
        return formatted
    }
}
