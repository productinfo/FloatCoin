//
//  Provider.swift
//  Jo
//
//  Created by Kaunteya Suryawanshi on 24/12/17.
//  Copyright © 2017 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation
enum Exchange: String {
    case bitfinex, cex, coinbase, kraken

    // Whenever new exchange is added to the enum, add it to `all`.
    // In all make sure that it always stays sorted
    static var all: [Exchange] {
        return [.bitfinex, .cex, .coinbase, .kraken]
    }

    var description: String {
        switch self {
        case .bitfinex: return "Bitfinex"
        case .cex: return "CEX"
        case .coinbase: return "Coinbase"
        case .kraken: return "Kraken"
        }
    }

    var type: ExchangeDelegate.Type {
        switch self {
        case .bitfinex: return Bitfinex.self
        case .cex: return CEX.self
        case .coinbase: return Coinbase.self
        case .kraken: return Kraken.self
        }
    }
}

extension Exchange: Comparable {
    static func <(lhs: Exchange, rhs: Exchange) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}