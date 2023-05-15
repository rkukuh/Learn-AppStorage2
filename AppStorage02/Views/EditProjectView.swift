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
    
    @State private var showAddItemView: Bool = false
    
    var body: some View {
        Form {
            Section {
                TextField("Project name", text: $project.name)
            } header: {
                Text("Project")
            }
            
            Section {
                ForEach(project.items) { item in
                    HStack {
                        Text(item.name)
                        
                        Spacer()
                        
                        Text("\(item.quantity) \(item.measurementUnit)")
                        
                        Spacer()
                        
                        Text("\(item.price)")
                    }
                }
                
                Button {
                    showAddItemView = true
                } label: {
                    Label("Add Fashion Item", systemImage: "plus.circle")
                        .multilineTextAlignment(.trailing)
                }

            } header: {
                Text("Fashion Items")
            }
        } //: Form
        .sheet(isPresented: $showAddItemView) {
            NavigationStack {
                AddItemView(project: $project)
                    .toolbar {
                        ToolbarItem(placement: .cancellationAction) {
                            Button("Dismiss") {
                                showAddItemView = false
                            }
                        }
                        
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Add") {
                                showAddItemView =  false
                            }
                        }
                    }
            }
        }
    }
}

struct EditProjectView_Previews: PreviewProvider {
    static var previews: some View {
        EditProjectView(project: .constant(Project.sampleData[0]))
    }
}
