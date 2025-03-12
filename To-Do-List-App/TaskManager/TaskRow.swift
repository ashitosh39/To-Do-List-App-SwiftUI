//
//  TaskRow.swift
//  To-Do-List-App
//
//  Created by Ashitosh on 11/03/25.
//

import SwiftUI

struct TaskRow: View {
    let task: Task
    @ObservedObject var taskManager: TaskManager
    
    var body: some View {
        HStack {
            Button(action: {
                taskManager.toggleTaskCompletion(task: task)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(task.isCompleted ? .green : .gray)
            }
            .buttonStyle(PlainButtonStyle())
            
            Text(task.title)
                .strikethrough(task.isCompleted, color: .gray)
                .foregroundColor(task.isCompleted ? .gray : .primary)
            
            Spacer()
            
            NavigationLink(destination: EditTaskView(task: task, taskManager: taskManager)) {
                Image(systemName: "pencil")
                    .foregroundColor(.blue)
            }
        }
    }
}
