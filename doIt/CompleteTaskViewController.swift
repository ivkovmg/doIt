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
    var task : Task? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if task!.important{
            taskLabel.text = "‼️\(task!.name!)" //DON'T KNOW WHY THERE IS A ?
        }else{
            taskLabel.text = task!.name! //DON'T KNOW WHY THERE IS A ?
        }

    }

    @IBAction func completeTapped(_ sender: Any) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(task!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
    }
   
}
