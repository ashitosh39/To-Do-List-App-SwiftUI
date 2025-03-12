//
//  EditTaskView.swift
//  To-Do-List-App
//
//  Created by Ashitosh on 11/03/25.
//

import SwiftUI

struct EditTaskView: View {
    let task: Task
    @ObservedObject var taskManager: TaskManager
    @State private var updatedTitle = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $updatedTitle)
            }
            .navigationTitle("Edit Task")
            .onAppear {
                updatedTitle = task.title
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !updatedTitle.isEmpty {
                            taskManager.updateTask(task: task, newTitle: updatedTitle)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}
