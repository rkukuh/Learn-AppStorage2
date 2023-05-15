//
//  ProjectDetailView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @Binding var project: Project
    
    @State private var totalPrice: Int = 0
    
    var body: some View {
        List {
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
            } header: {
                Text("Fashion Items")
            }
            
            Section {
                HStack {
                    Text("TOTAL")
                    
                    Spacer()
                    
                    Text("\(totalPrice)")
                }
            } header: {
                Text("Calculation")
            }
        }
        .navigationTitle(project.name)
        .onAppear {
            calcTotalPrice()
        }
    }
    
    func calcTotalPrice() {
        for item in project.items {
            totalPrice += item.price
        }
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProjectDetailView(project: .constant(Project.sampleData[0]))
        }
    }
}
