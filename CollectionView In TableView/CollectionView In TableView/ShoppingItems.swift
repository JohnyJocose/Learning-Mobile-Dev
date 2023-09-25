//
//  ShoppingItems.swift
//  CollectionView In TableView
//
//  Created by Johnathan Huijon on 9/11/23.
//

import UIKit

// This file consists solely of a struct filled with the information we will use for the example in this file—specifically, a shopping catalog of apple products.

struct ShoppingCatalog {
    
    static let products = ["Vision Pro", "Apple Watch", "Apple TV", "iPad", "Airpods", "iPhone"]
    
    static let headerTitles = ["Buy a Vision Pro", "Buy an Apple Watch", "Buy an Apple TV", "Buy an iPad", "Buy Aiprods", "Buy an iPhone"]
    
    static let genres: [[String]] = [allVisionPros.reversed(), allAppleWatches.reversed(), allAppleTVs.reversed(), alliPads.reversed(), allAirpods.reversed(), alliPhones.reversed()]
    
    static var allVisionPros: [String] = [
        "Vision Pro"
    ]
    
    static var allAppleWatches: [String] = [
        "Apple Watch Series  1",
        "Apple Watch Series 2",
        "Apple Watch Series 3",
        "Apple Watch Series 4",
        "Apple Watch Series 5",
        "Apple Watch SE (1st generation)",
        "Apple Watch Series 6",
        "Apple Watch Series 7",
        "Apple Watch SE",
        "Apple Watch Series 8",
        "Apple Watch Ultra"
    ]
    
    static var allAppleTVs: [String] = [
        "Apple TV (1st generation)",
        "Apple TV (2nd generation)",
        "Apple TV (3rd generation)",
        "Apple TV HD",
        "Apple TV 4K (1st generation)",
        "Apple TV 4K (2nd generation)",
        "Apple TV 4K (3rd generation) Wi-Fi",
        "Apple TV 4K (3rd generation) Wi-Fi + Ethernet"
    ]
    
    static var alliPads: [String] = [
        "iPad",
        "iPad mini",
        "iPad Air",
        "iPad Pro"
    ]
    
    static var allAirpods: [String] = [
        "Airpods",
        "Airpods Pro",
        "Airpods Max"
    ]
    
    static var alliPhones: [String] = [
        "iPhone",
        "iPhone 3G",
        "iPhone 3GS",
        "iPhone 4",
        "iPhone 4S",
        "iPhone 5",
        "iPhone 5s",
        "iPhone 5c",
        "iPhone 6",
        "iPhone 6+",
        "iPhone 6s",
        "iPhone 6s+",
        "iPhone SE",
        "iPhone 7",
        "iPhone 7+",
        "iPhone 8",
        "iPhone 8+",
        "iPhone X",
        "iPhone XS",
        "iPhone XS Max",
        "iPhone XR",
        "iPhone 11",
        "iPhone 11 Pro",
        "iPhone 11 Pro Max",
        "iPhone SE 2",
        "iPhone 12",
        "iPhone 12 mini",
        "iPhone 12 Pro",
        "iPhone 12 Pro Max",
        "iPhone 13",
        "iPhone 13 mini",
        "iPhone 13 Pro",
        "iPhone 13 Pro Max",
        "iPhone SE 3",
        "iPhone 14",
        "iPhone 14+",
        "iPhone 14 Pro",
        "iPhone 14 Pro Max"
    ]
    
}
