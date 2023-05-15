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
    var quantity: Int
    var price: Int
    var measurementUnit: String
    
    static let sampleData: [Item] = [
        Item(store: "Toko Kain", name: "Kain katun", quantity: 2, price: 25_000, measurementUnit: "meter"),
        Item(store: "Toko Benang", name: "Benang jahit", quantity: 3, price: 1_500, measurementUnit: "pcs"),
        Item(store: "Toko Kancing", name: "Kancing baju", quantity: 1, price: 3_000, measurementUnit: "dozen"),
    ]
}
