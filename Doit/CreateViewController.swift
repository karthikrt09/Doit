//
//  CreateViewController.swift
//  Doit
//
//  Created by Karthik Thirunavukkarasan on 4/3/17.
//  Copyright © 2017 Karthik Thiru. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var importantSwitch: UISwitch!
    
    var previousVC = TaskViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        //create a task from the outlet information
        
        let task = Task()
        task.name = taskNameTextField.text!
        task.impartant = importantSwitch.isOn
        
        // Add new task to array in previous viewcontroller
        previousVC.tasks.append(task)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)
    }

}
