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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    

    @IBAction func AddTap(_ sender: Any) {
        //Create Task From Outlet information
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let task = Task(context: context)
        task.name = taskNameTextField.text!
        task.important = importantSwitch.isOn
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        //Pop back
        navigationController!.popViewController(animated: true)
    }
    
    
    
}
