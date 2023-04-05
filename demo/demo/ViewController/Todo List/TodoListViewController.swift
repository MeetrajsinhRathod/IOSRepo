//
//  TodoListViewController.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 27/03/23.
//

import UIKit

class TodoListViewController: UIViewController {

    private var todos = [
        Todo(title: "task-1"),
        Todo(title: "task-2"),
        Todo(title: "task-3"),
        Todo(title: "task-4")
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func isEditing(_ sender: Any) {
        tableView.isEditing = !tableView.isEditing
    }
    
    @IBAction func addTask(_ sender: Any) {
        var taskTextField = UITextField()
        let alert = UIAlertController(title: "Add new task", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)

        let save = UIAlertAction(title: "Add", style: .default) { [weak self] (save) in
            self?.todos.append(Todo(title: taskTextField.text ?? ""))
            self?.tableView.reloadData()
        }
        alert.addTextField  { (text) in
            taskTextField = text
            taskTextField.placeholder = "Enter task"
        }
        alert.addAction(cancel)
        alert.addAction(save)
        
        self.present(alert, animated: true)
    }
    
}

extension TodoListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? TodoCellTableViewCell
        else { return UITableViewCell()}
        cell.set(title: todos[indexPath.row].title , isDone: todos[indexPath.row].isDone)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}

extension TodoListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let todo = todos.remove(at: sourceIndexPath.row)
        todos.insert(todo, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var taskTextField = UITextField()
        taskTextField.text = todos[indexPath.row].title

        let alert = UIAlertController(title: "Modify task", message: "", preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let save = UIAlertAction(title: "Add", style: .default) { [weak self] (save) in
            
            self?.todos[indexPath.row] = Todo(title: taskTextField.text ?? "Title not found")
            self?.tableView.reloadData()
        }
        
        alert.addTextField  { [weak self] (text) in
            taskTextField = text
            taskTextField.text = self?.todos[indexPath.row].title
            taskTextField.placeholder = "Enter task"
        }
        
        alert.addAction(cancel)
        alert.addAction(save)
        self.present(alert, animated: true)

        tableView.deselectRow(at: indexPath, animated: true)
    }
     
}
