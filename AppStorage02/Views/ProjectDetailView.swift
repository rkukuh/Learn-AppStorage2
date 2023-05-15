//
//  ProjectDetailView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import SwiftUI

struct ProjectDetailView: View {
    
    @Binding var project: Project
    
    var body: some View {
        List {
            Section {
                ForEach(project.items) { item in
                    Text(item.name)
                }
            } header: {
                Text("Fashion Items")
            }
        }
        .navigationTitle(project.name)
    }
}

struct ProjectDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ProjectDetailView(project: .constant(Project.sampleData[0]))
        }
    }
}
