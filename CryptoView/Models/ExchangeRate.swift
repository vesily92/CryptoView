//
//  ExchangeRate.swift
//  CryptoView
//
//  Created by Василий Пронин on 28.09.2021.
//

import Foundation

enum Link: String {
    case rates = "https://www.alphavantage.co/query?function=CURRENCY_EXCHANGE_RATE&from_currency=BTC&to_currency=USD&apikey=X6PVSVCEWIEVCUFF"
    case symbols = "https://finnhub.io/api/v1/crypto/symbol?exchange=binance&token=c56qbp2ad3ibpaikhsrg"
    case currencies = "https://api.nomics.com/v1/currencies/ticker?key=47b13ceeba5dbb7b6038f2cb14f5044cc2997f7f&ids=BTC,ETH,XRP,USDT,ADA,BNB,SOL,USDC,DOT,DOGE,AVAX,%20LUNA,BUSD,UNI&interval=1d,30d&convert=EUR&per-page=100&page=1"
}

struct CurrenciesTicker: Decodable {
    let currency: String?
    let id: String?
    let status: String?
    let price: String?
    let priceDate: String?
    let priceTimestamp: String?
    let symbol: String?
    let circulatingSupply: String?
    let maxSupply: String?
    let name: String?
    let logoUrl: String?
    let marketCap: String?
    let marketCapDominance: String?
    let transparentMarketCap: String?
    let numExchanges: String?
    let numPairs: String?
    let numPairsUnmapped: String?
    let firstCandle: String?
    let firstTrade: String?
    let firstOrderBook: String?
    let firstPricedAt: String?
    let rank: String?
    let rankDelta: String?
    let high: String?
    let highTimestamp: String?
    let oneDay: OneDay?
    
    enum CodingKeys: String, CodingKey {
        case currency = "currency"
        case id = "id"
        case status = "status"
        case price = "price"
        case priceDate = "price_date"
        case priceTimestamp = "price_timestamp"
        case symbol = "symbol"
        case circulatingSupply = "circulating_supply"
        case maxSupply = "max_supply"
        case name = "name"
        case logoUrl = "logo_url"
        case marketCap = "market_cap"
        case marketCapDominance = "market_cap_dominance"
        case transparentMarketCap = "transparent_market_cap"
        case numExchanges = "num_exchanges"
        case numPairs = "num_pairs"
        case numPairsUnmapped = "num_pairs_unmapped"
        case firstCandle = "first_candle"
        case firstTrade = "first_trade"
        case firstOrderBook = "first_order_book"
        case firstPricedAt = "first_priced_at"
        case rank = "rank"
        case rankDelta = "rank_delta"
        case high = "high"
        case highTimestamp = "high_timestamp"
        case oneDay = "1d"
    }
}

struct OneDay: Decodable {
    let priceChange: String?
    let priceChangePct: String?
    let volume: String?
    let volumeChange: String?
    let volumeChangePct: String?
    let marketCapChange: String?
    let marketCapChangePct: String?
    let transparentMarketCapChange: String?
    let transparentMarketCapChangePct: String?
    let volumeTransparency: [VolumeTransparency]?
    
    enum CodingKeys: String, CodingKey {
        case priceChange = "price_change"
        case priceChangePct = "price_change_pct"
        case volume = "volume"
        case volumeChange = "volume_change"
        case volumeChangePct = "volume_change_pct"
        case marketCapChange = "market_cap_change"
        case marketCapChangePct = "market_cap_change_pct"
        case transparentMarketCapChange = "transparent_market_cap_change"
        case transparentMarketCapChangePct = "transparent_market_cap_change_pct"
        case volumeTransparency = "volume_transparency"
    }
}

struct VolumeTransparency: Decodable {
    let grade: String?
    let volume: String?
    let volumeChange: String?
    let volumeChangePct: String?
    
    enum CodingKeys: String, CodingKey {
        case grade = "grade"
        case volume = "volume"
        case volumeChange = "volume_change"
        case volumeChangePct = "volume_change_pct"
    }
}

struct Candles {
    
}
