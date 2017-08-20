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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        tableView.dataSource = self //MUST BE SET-UP FOR TABLEVIEW
        tableView.delegate = self //MUST BE SET-UP FOR TABLE VIEW
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getTasks()
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.important{
            cell.textLabel?.text = "‼️\(task.name!)" //DON'T KNOW WHY THERE IS A ?
        }else{
        cell.textLabel?.text = task.name! //DON'T KNOW WHY THERE IS A ?
        }
        return cell
            
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    

    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    func getTasks(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
           tasks = try context.fetch(Task.fetchRequest()) as! [Task]
            print(tasks)
        } catch{
            print("Opps we have an error")
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectTaskSegue"{
            let nextVC = segue.destination as! CompleteTaskViewController
            nextVC.task = sender as? Task
           
        }
    }
}

