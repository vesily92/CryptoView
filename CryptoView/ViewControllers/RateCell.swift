//
//  RateCell.swift
//  CryptoView
//
//  Created by Василий Пронин on 28.09.2021.
//

import UIKit

class RateCell: UITableViewCell {
    
    @IBOutlet var currencyLogo: UIImageView! {
        didSet {
            currencyLogo.clipsToBounds = true
            currencyLogo.layer.cornerRadius = currencyLogo.frame.height / 2
            currencyLogo.backgroundColor = .white
        }
    }
    
    @IBOutlet var idLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var changeLabel: UILabel!
   
    func configure(with currency: CurrenciesTicker?) {
        
        idLabel.text = format(currency?.id, withPostfix: "USD")
        nameLabel.text = format(currency?.name, withPostfix: " / U.S. Dollar")
        nameLabel.textColor = .systemGray

        priceLabel.text = format(currency?.price)
        changeLabel.text = format(currency?.oneDay?.priceChange,
                                  and: currency?.oneDay?.priceChangePct,
                                  withPostfix: "%")
        changeLabel.textColor = getColor(of: currency?.oneDay?.priceChange)
        
        NetworkManager.shared.fetchImage(from: currency?.logoUrl) { result in
            switch result {
            case .success(let imageData):
                self.currencyLogo.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}
    
extension RateCell {
    
    private func format(_ label: String?, withPostfix: String) -> String {
        guard let label = label else {
            return ""
        }
        
        return label + withPostfix
    }
    
    private func format(_ price: String?, and percent: String? = nil, withPostfix: String? = nil) -> String {
        guard let price = price else {
            return ""
        }
        let priceValue = (price as NSString).floatValue
        var formattedPrice = String(format: "%.2f", priceValue)
        
        guard let percent = percent else {
            return formattedPrice
        }
        
        let percentValue = (percent as NSString).floatValue
        var formattedPercent = String(format: "%.2f", percentValue)
    
        if round(100 * priceValue) / 100 == 0 && formattedPrice.first == "-" {
            formattedPrice.removeFirst()
            formattedPercent.removeFirst()
        }
        var formatted = formattedPrice + " " + formattedPercent
        
        if let postfix = withPostfix {
            formatted += postfix
        }
        
        return formatted
    }
    
    private func getColor(of price: String?) -> UIColor? {
        guard let price = price else {
            return nil
        }
        let formatted = format(price)
        
        if (formatted as NSString).floatValue > 0 {
            return .systemGreen
        } else if (formatted as NSString).floatValue < 0 {
            return .systemRed
        } else {
            return .systemGray
        }
    }
}
