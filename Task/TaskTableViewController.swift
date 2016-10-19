//
//  TaskTableViewController.swift
//  Task
//
//  Created by Chan Hee Park on 10/13/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

class TaskTableViewController: UITableViewController, AddItemViewControllerDelegate {
    var taskName: String?
    var taskDetail: String?
    var tasks: [Task] = []
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUserInterface()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(checkForOutdatedTasks), userInfo: nil, repeats: true)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    func checkForOutdatedTasks() {
        for (index, task) in tasks.enumerated() {
            if task.isCompleted() {
                let rightNow = NSDate()
                let timePassed = rightNow.timeIntervalSince(task.completedTime as! Date)
                print(timePassed)
                if timePassed > 84600 {
                    self.tasks.remove(at: index)
                    self.tableView.deleteRows(at: [IndexPath(row: index, section: 0)], with: .none)
                    self.tableView.reloadData()
                }
                
            }
        }
    }
    
    func addTaskButtonPressed(sender: UIControlEvents) {
        let vcToAdd = AddItemViewController()
        vcToAdd.delegate = self
        self.navigationController?.pushViewController(vcToAdd, animated: true)
    }
    
    func statButtonPressed(sender: UIControlEvents) {
        let vcToStat = StatViewController(numberOfCompletion: numberOfCompletedTasks())
        self.navigationController?.pushViewController(vcToStat, animated: true)
        
    }
    
    func numberOfCompletedTasks() -> Int {
        var n = 0
        for t in tasks {
            if (t.isCompleted()) {
                n = n + 1
            }
        }
        return n
    }
    
    
    func setUpUserInterface() {
        // Bar setup
        let addTaskButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed))
        self.navigationItem.rightBarButtonItem = addTaskButton
        self.navigationItem.title = "To Do List"
        self.tableView.backgroundColor = UIColor.lightGray
        
        let statisticButton = UIBarButtonItem(title: "Stats", style: .plain, target: self, action: #selector(statButtonPressed))
        self.navigationItem.leftBarButtonItem = statisticButton
    }
    
    func didFinishAddingTask(taskName: String, taskDetail: String) {
        let task = Task(title: taskName, detail: taskDetail)
        tasks.append(task)
        
        // Update table
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        let cell: TaskTableViewCell = TaskTableViewCell(style: .subtitle, reuseIdentifier: "what", task: tasks[row])
        // Configure the cell...
        
        cell.textLabel?.text = self.tasks[row].title
        cell.detailTextLabel?.text = self.tasks[row].detail
        cell.backgroundColor = UIColor.white
        
        if (tasks[row].isCompleted()) {
            cell.imageView!.image = UIImage(named:"Ok_complete.png")
        } else {
            cell.imageView!.image = UIImage(named:"OK_incomplete.png")
        }
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let cell = tableView.cellForRow(at: indexPath)
        if tasks[row].isCompleted() {
            cell?.imageView!.image = UIImage(named:"OK_incomplete.png")
            tasks[row].completed = false
        } else {
            cell?.imageView!.image = UIImage(named:"OK_complete.png")
            tasks[row].completed = true
            tasks[row].startTimer()
        }
        
        
    }
    

    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            //tableView.deleteRows(at: [indexPath], with: .fade)
            tasks.remove(at: indexPath.row)
            self.tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

}
