//
//  AddTaskView.swift
//  To-Do-List-App
//
//  Created by Ashitosh on 11/03/25.
//

import SwiftUI

struct AddTaskView: View {
    @ObservedObject var taskManager: TaskManager
    @State private var taskTitle = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Task Title", text: $taskTitle)
            }
            .navigationTitle("Add Task")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        if !taskTitle.isEmpty {
                            taskManager.addTask(title: taskTitle)
                            presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            }
        }
    }
}
