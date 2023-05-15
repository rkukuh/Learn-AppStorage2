//
//  Item.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import Foundation

struct Item: Identifiable, Codable {
    var id = UUID()
    var store: String
    var name: String
    var price: Int
    var quantity: Int
    var measurementUnit: String
    
    static let sampleData: [Item] = [
        Item(store: "Toko Kain", name: "Kain katun", price: 25_000, quantity: 2, measurementUnit: "meter"),
        Item(store: "Toko Benang", name: "Benang jahit", price: 1_500, quantity: 3, measurementUnit: "pcs"),
        Item(store: "Toko Kancing", name: "Kancing baju", price: 3_000, quantity: 1, measurementUnit: "dozen"),
    ]
}
