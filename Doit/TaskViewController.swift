//
//  TaskViewController.swift
//  Doit
//
//  Created by Karthik Thirunavukkarasan on 4/3/17.
//  Copyright © 2017 Karthik Thiru. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasks = makeTask()
        tableView.dataSource = self
        tableView.delegate = self
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        if task.impartant{
            cell.textLabel?.text = "‼️\(task.name)"
        }
        else{
            cell.textLabel?.text = "📌\(task.name)"
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = tasks[indexPath.row]
        performSegue(withIdentifier: "selectTaskSegue", sender: tasks)
    }
    
    func makeTask()-> [Task]{
        let task1 = Task()
        task1.name = "Go for Run"
        task1.impartant = false
        
        let task2 = Task()
        task2.name = "Buy Cheese"
        task2.impartant = true
        
        let task3 = Task()
        task3.name = "Mow Garden"
        task3.impartant = false
        
        return[task1,task2,task3]
    }

    @IBAction func pluseTapped(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateViewController
        nextVC.previousVC = self
    }

}

