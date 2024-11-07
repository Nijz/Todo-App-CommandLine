import Foundation

class Task {

    var name: String
    var completed: Bool

    init(name: String, completed: Bool = false) {
        self.name = name
        self.completed = completed
    }
}

class TodoList {

    var tasks: [Task] = []

    // add new task
    func addTask(_ name: String) {

        let task = Task(name: name)
        tasks.append(task)

        print("Task added: \(name)")
    }

    // Display all tasks
    func displayTasks() {

        if tasks.isEmpty {
            print("No tasks to display.")
        }

        for (i, task) in tasks.enumerated() {
            let status = task.completed ? "✅" : "❌"
            print("\(i + 1). \(status) \(task.name)")
        }
    }

    // Mark task as completed
    func markTaskCompleted(_ index: Int) {
        
        if index < 0 || index >= tasks.count {
            print("Invalid index.")
            return
        }

        tasks[index-1].completed = true
        print("Task marked as completed: \(tasks[index-1].name)")
    }

    // Remove task
    func removeTask(_ index: Int) {

        if index < 0 || index >= tasks.count {
            print("Invalid index.")
            return
        }

        tasks.remove(at: index)
        print("Task removed: \(tasks[index].name)")
    }
}

func showMenu() {

    print("\nWelcome to the To-do list app!") 
    print("1. Add task")
    print("2. Display tasks")
    print("3. Mark task as completed")
    print("4. Remove task")
    print("5. Exit")

}

func getUserInput() -> Int {

    if let input = readLine(), let choice = Int(input), choice >= 1 && choice <= 5 {
        return choice
    } else {
        print("Invalid input. Please try again.")
        return getUserInput()
    }
}

func main() {

    let todoList = TodoList()

    var running = true

    while running {
        showMenu()
        print("Enter your choice: ")
        let choice = getUserInput()

        switch choice {
        case 1:
            print("Enter the task: ")
            if let taskName = readLine(), !taskName.isEmpty {
                todoList.addTask(taskName)
            } else {
                print("Invalid task name.")
            }
        
        case 2: 
            todoList.displayTasks()

        case 3: 
            print("Enter the index of the task: ")
            if let index = readLine(), let indexInt = Int(index), indexInt >= 0 && indexInt < todoList.tasks.count {
                todoList.markTaskCompleted(indexInt)
            } else {
                print("Invalid index.")
            }

        case 4: 
            print("Enter the index of the task: ")
            if let index = readLine(), let indexInt = Int(index), indexInt >= 0 && indexInt < todoList.tasks.count {
                todoList.removeTask(indexInt)
            } else {
                print("Invalid index.")
            }

        case 5: 
            running = false
            print("Exiting app... :)")

        default: 
            print("Invalid choice. Please try again.")
        }
    }
}

main()