//
//  TasksViewController.swift
//  doIt
//
//  Created by Matthew Ivkovich on 8/18/17.
//  Copyright © 2017 Mivko Tech. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {//ADD LAST TWO FOR TABLE VIEW

    @IBOutlet weak var tableView: UITableView!
    var tasks :[Task] = []
    var selectedIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = MakeTasks()
        
        tableView.dataSource = self //MUST BE SET-UP FOR TABLEVIEW
        tableView.delegate = self //MUST BE SET-UP FOR TABLE VIEW
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.blnImpt{
            cell.textLabel?.text = "‼️\(task.strName)" //DON'T KNOW WHY THERE IS A ?
        }else{
        cell.textLabel?.text = task.strName //DON'T KNOW WHY THERE IS A ?
        }
        return cell
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedIndex = indexPath.row
        
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    func MakeTasks() -> [Task]{
        let task1 = Task()
            task1.strName = "Walk the Dog"
            task1.blnImpt = false
        
        let task2 = Task()
            task2.strName = "Buy Cheese"
            task2.blnImpt = true
        
        let task3 = Task()
            task3.strName = "Mow the Lawn"
            task3.blnImpt = false
        
        return [task1, task2, task3]
        
    }
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addSegue"{
            let nextVC = segue.destination as! CreateTaskViewController
            nextVC.previousVC = self
        }else if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

