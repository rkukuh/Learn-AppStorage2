//
//  ContentView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import SwiftUI

struct AddItemView: View {
    
    @AppStorage("projectStorage") var projectStorage: Data = Data()
    
    @Binding var project: Project
    
    @State private var itemName: String = ""
    @State private var itemPrice: Int = 0
    @State private var itemQuantity: Int = 0
    @State private var itemMeasurement: String = "m (meter)"
    
    var body: some View {
        Form {
            VStack {
                HStack {
                    Text("Name")
                    TextField("Item name", text: $itemName)
                }
                
                HStack {
                    Text("Price")
                    TextField("Item price", value: $itemPrice, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("Quantity")
                    TextField("Item quantity", value: $itemQuantity, formatter: NumberFormatter())
                }
                
                HStack {
                    Text("Measurement")
                    TextField("Measurement unit", text: $itemMeasurement)
                        .disabled(true)
                }
                
                Button(action: {
                    let newItem = Item(store: "",
                                       name: itemName,
                                       price: itemPrice,
                                       quantity: itemQuantity,
                                       measurementUnit: "m")
                    
                    project.items.append(newItem)
                    
                    guard let encodedStorage = try? JSONEncoder().encode(projectStorage) else { return }
                    
                    self.projectStorage = encodedStorage
                    
                    itemName = ""
                    itemPrice = 0
                    itemQuantity = 0
                }) {
                    Text("Add New Item")
                }
                .disabled(itemName.isEmpty)
                .buttonStyle(.bordered)
            }
        }
        .navigationTitle("New Item")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddItemView(project: .constant(Project.sampleData[0]))
        }
    }
}
