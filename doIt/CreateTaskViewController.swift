//
//  CreateTaskViewController.swift
//  doIt
//
//  Created by Matthew Ivkovich on 8/19/17.
//  Copyright © 2017 Mivko Tech. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction func AddTap(_ sender: Any) {
        //Create Task From Outlet information
        
        let task = Task()
        task.strName = taskNameTextField.text!
        task.blnImpt = importantSwitch.isOn
    
        //Add new task to array in previous VC
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }
    
    
    
}
