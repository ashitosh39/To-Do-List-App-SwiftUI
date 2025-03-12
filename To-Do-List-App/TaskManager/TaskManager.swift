//
//  TaskManager.swift
//  To-Do-List-App
//
//  Created by Ashitosh on 11/03/25.
//

import Foundation

class TaskManager: ObservableObject {
    @Published var tasks: [Task] = []
    private let key = "tasks"
    
    init() {
        loadTasks()
    }
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
        saveTasks()
    }
    
    func toggleTaskCompletion(task: Task) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    func updateTask(task: Task, newTitle: String) {
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index].title = newTitle
            saveTasks()
        }
    }
    
    private func saveTasks() {
        if let encoded = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
    
    private func loadTasks() {
        if let data = UserDefaults.standard.data(forKey: key),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: data) {
            tasks = decodedTasks
        }
    }
}
