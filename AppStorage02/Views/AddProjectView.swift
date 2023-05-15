//
//  AddNewProjectView.swift
//  AppStorage02
//
//  Created by R. Kukuh on 15/05/23.
//

import SwiftUI

struct AddProjectView: View {
    
    @Binding var projects: [Project]
    @Binding var showAddProjectView: Bool
    
    @State private var newProject = Project.emptyProject
    
    var body: some View {
        NavigationStack {
            EditProjectView(project: $newProject)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            showAddProjectView = false
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            showAddProjectView =  false
                            
                            projects.append(newProject)
                        }
                    }
                }
        } //: NavigationStack
    }
}

struct AddProjectView_Previews: PreviewProvider {
    static var previews: some View {
        AddProjectView(projects: .constant(Project.sampleData),
                       showAddProjectView: .constant(true))
    }
}
