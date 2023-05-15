//
//  ProjectView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 12/05/23.
//

import SwiftUI

struct ProjectsView: View {
    
    @AppStorage("projectStorage") var projectStorage: Data = Data()
    
    @State private var projects: [Project] = [Project]()
    @State private var showAddProjectView: Bool = false
    @State private var isFirstTime: Bool = true
    
    var body: some View {
        NavigationStack {
            Group {
                if projects.isEmpty {
                    Text("No project")
                        .font(.title)
                        .foregroundColor(.secondary)
                } else {
                    List($projects) { $project in
                        NavigationLink(destination: ProjectDetailView(project: $project)) {
                            Text(project.name)
                        }
                    }
                }
            } //: Group
            .navigationTitle("Fashion Projects")
            .toolbar {
                Button {
                    showAddProjectView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .onAppear {
                if isFirstTime {
                    loadSampleData()
                    isFirstTime = false
                }
                
                guard let decodedProjects = try? JSONDecoder().decode([Project].self, from: projectStorage) else {
                    return
                }
                
                projects = decodedProjects
            }
            .sheet(isPresented: $showAddProjectView) {
                AddProjectView(projects: $projects,
                               showAddProjectView: $showAddProjectView)
            }
        } //: NavigationStack
    }
    
    func loadSampleData() {
        guard let encodedProjects = try? JSONEncoder().encode(Project.sampleData) else {
            return
        }
        
        self.projectStorage = encodedProjects
    }
}

struct ProjectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectsView()
    }
}
