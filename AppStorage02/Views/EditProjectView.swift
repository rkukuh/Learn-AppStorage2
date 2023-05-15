//
//  EditProjectView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 15/05/23.
//

import SwiftUI

struct EditProjectView: View {
    
    @AppStorage("projectStorage") var projectStorage: Data = Data()
    @Binding var project: Project
    
    @State private var projectName: String = ""
    @State private var itemName: String = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Project name", text: $project.name)
            } header: {
                Text("Project")
            }
            
            Section {
                ForEach(project.items) { item in
                    Text(item.name)
                }
                
                HStack {
                    TextField("New item", text: $itemName)
                    
                    Button(action: {
                        withAnimation {
                            let newItem = Item(store: "", name: itemName, quantity: 1, price: 1_000, measurementUnit: "m")
                            
                            project.items.append(newItem)
                            
                            guard let encodedStorage = try? JSONEncoder().encode(projectStorage) else { return }
                            
                            self.projectStorage = encodedStorage
                            
                            itemName = ""
                        }
                    }) {
                        Image(systemName: "plus.circle.fill")
                    } //: Button
                    .disabled(itemName.isEmpty)
                }
            } header: {
                Text("Items")
            }
        }
    }
}

struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: .constant(Project.sampleData[0]))
    }
}
