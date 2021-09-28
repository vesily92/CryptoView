//
//  ExchangeRate.swift
//  CryptoView
//
//  Created by Василий Пронин on 28.09.2021.
//

import Foundation

struct ExchangeRate: Decodable {
    let fromCurrencyCode: String?
    let fromCurrencyName: String?
    let toCurrencyCode: String?
    let toCurrencyName: String?
    let exchangeRate: String?
    let lastRefreshed: String?
    let timeZone: String?
    let bidPrice: String?
    let askPrice: String?
    
    enum CodingKeys: String, CodingKey {
        case fromCurrencyCode = "1. From_Currency Code"
        case fromCurrencyName = "2. From_Currency Name"
        case toCurrencyCode = "3. To_Currency Code"
        case toCurrencyName = "4. To_Currency Name"
        case exchangeRate = "5. Exchange Rate"
        case lastRefreshed = "6. Last Refreshed"
        case timeZone = "7. Time Zone"
        case bidPrice = "8. Bid Price"
        case askPrice = "9. Ask Price"
    }
}

struct Intraday: Decodable {
    let metaData: MetaData?
    let timeSeriesCrypto: TimeSeriesCrypto?
    
    enum CodingKeys: String, CodingKey {
        case metaData = "Meta Data"
        case timeSeriesCrypto = "Time Series Crypto (5min)"
    }
}

struct MetaData: Decodable {
    let information: String?
    let digitalCurrencyCode: String?
    let digitalCurrencyName: String?
    let marketCode: String?
    let marketName: String?
    let lastRefreshed: TimeSeriesCrypto?
    let interval: String?
    let outputSize: String?
    let timeZone: String?
    
    enum CodingKeys: String, CodingKey {
        case information = "1. Information"
        case digitalCurrencyCode = "2. Digital Currency Code"
        case digitalCurrencyName = "3. Digital Currency Name"
        case marketCode = "4. Market Code"
        case marketName = "5. Market Name"
        case lastRefreshed = "6. Last Refreshed"
        case interval = "7. Interval"
        case outputSize = "8. Output Size"
        case timeZone = "9. Time Zone"
    }
}

struct TimeSeriesCrypto: Decodable {
    let open: String?
    let high: String?
    let low: String?
    let close: String?
    let volume: Int?
    
    enum CodingKeys: String, CodingKey {
        case open = "1. open"
        case high = "2. high"
        case low = "3. low"
        case close = "4. close"
        case volume = "5. volume"
    }
}

