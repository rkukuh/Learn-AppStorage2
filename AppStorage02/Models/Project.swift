//
//  Project.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import Foundation

struct Project: Identifiable, Codable {
    var id = UUID()
    var name: String
    var items: [Item]
    
    static var emptyProject: Project {
        Project(name: "", items: [])
    }
    
    static let sampleData: [Project] = [
        Project(name: "Baju Anak",
                items: [
                    Item.sampleData[0],
                    Item.sampleData[1],
                    Item.sampleData[2]
                ]),
        Project(name: "Sweater",
                items: [
                    Item.sampleData[0],
                    Item.sampleData[1]
                ])
    ]
}
