//
//  AddNewProjectView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 15/05/23.
//

import SwiftUI

struct AddProjectView: View {
    
    @Binding var projects: [Project]
    @Binding var showNewProjectView: Bool
    @State private var newProject = Project.emptyProject
    
    var body: some View {
        NavigationStack {
            EditProjectView(project: $newProject)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            showNewProjectView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            showNewProjectView =  false
                            
                            projects.append(newProject)
                        }
                    }
                }
        }
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(projects: .constant(Project.sampleData),
                       showNewProjectView: .constant(true))
    }
}
