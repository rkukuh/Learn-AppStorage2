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
    @State private var itemQuantity: Int = 0
    @State private var itemPrice: Int = 0
    
    var body: some View {
        Form {
            VStack {
                TextField("Item name", text: $itemName)
                TextField("Item quantity", value: $itemQuantity, formatter: NumberFormatter())
                TextField("Item price", value: $itemPrice, formatter: NumberFormatter())
                
                Button(action: {
                    withAnimation {
                        let newItem = Item(store: "",
                                           name: itemName,
                                           quantity: itemQuantity,
                                           price: itemPrice,
                                           measurementUnit: "m")
                        
                        project.items.append(newItem)
                        
                        guard let encodedStorage = try? JSONEncoder().encode(projectStorage) else { return }
                        
                        self.projectStorage = encodedStorage
                        
                        itemName = ""
                        itemQuantity = 0
                        itemPrice = 0
                    }
                }) {
                    Text("Add New Item")
                } //: Button
                .disabled(itemName.isEmpty)
                .buttonStyle(.bordered)
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddItemView(project: .constant(Project.sampleData[0]))
        }
    }
}
