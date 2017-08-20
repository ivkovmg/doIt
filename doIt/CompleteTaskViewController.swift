//
//  CompleteTaskViewController.swift
//  doIt
//
//  Created by Matthew Ivkovich on 8/19/17.
//  Copyright © 2017 Mivko Tech. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {

    @IBOutlet weak var taskLabel: UILabel!
    var task = Task()
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if task.blnImpt{
            taskLabel.text = "‼️\(task.strName)" //DON'T KNOW WHY THERE IS A ?
        }else{
            taskLabel.text = task.strName //DON'T KNOW WHY THERE IS A ?
        }

    }

    @IBAction func completeTapped(_ sender: Any) {
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
        
    }
   
}