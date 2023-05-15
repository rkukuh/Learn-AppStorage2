//
//  ProjectView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import SwiftUI

struct ProjectView: View {
    
    @AppStorage("projectStorage") var projectStorage: Data = Data()
    @State private var projects: [Project] = [Project]()
    
    var body: some View {
        NavigationStack {
            Group {
                if projects.isEmpty {
                    Text("No project")
                        .font(.title)
                        .foregroundColor(.secondary)
                } else {
                    List(projects) { project in
                        Text(project.name)
                    }
                }
            } //: Group
            .navigationTitle("Projects")
            .toolbar {
                Button {
                    //
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                loadSampleData()
                
                guard let decodedProjects = try? JSONDecoder().decode([Project].self, from: projectStorage) else {
                    return
                }
                
                projects = decodedProjects
            }
        }
    }
    
    func loadSampleData() {
        guard let encodedProjects = try? JSONEncoder().encode(Project.sampleData) else {
            return
        }
        
        self.projectStorage = encodedProjects
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectView()
    }
}
