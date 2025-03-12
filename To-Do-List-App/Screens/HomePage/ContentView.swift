//
//  ContentView.swift
//  To-Do-List-App
//
//  Created by Ashitosh on 11/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var taskManager = TaskManager()
    @State private var isAddingTask = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskManager.tasks) { task in
                    TaskRow(task: task, taskManager: taskManager)
                }
                .onDelete(perform: taskManager.deleteTask)
            }
            .navigationTitle("To-Do List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        isAddingTask = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $isAddingTask) {
                AddTaskView(taskManager: taskManager)
            }
        }
        .preferredColorScheme(.dark) // Enable Dark Mode
    }
}
