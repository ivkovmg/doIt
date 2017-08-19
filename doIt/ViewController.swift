//
//  ViewController.swift
//  doIt
//
//  Created by Matthew Ivkovich on 8/18/17.
//  Copyright © 2017 Mivko Tech. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate , UITableViewDataSource {//ADD LAST TWO FOR TABLE VIEW

    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.dataSource = self //MUST BE SET-UP FOR TABLEVIEW
        tableView.delegate = self //MUST BE SET-UP FOR TABLE VIEW
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //THIS IS A TABLEVIEW FUNCTION ALREADY AVALIABLE IN SWIFT
        let cell = UITableViewCell()
        cell.textLabel?.text = "Hello" //DON'T KNOW WHY THERE IS A ?
        return cell
    }
}

