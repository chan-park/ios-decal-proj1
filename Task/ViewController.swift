//
//  ViewController.swift
//  Task
//
//  Created by Chan Hee Park on 10/13/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Setup UI
        self.setUpUserInterface()
        
    }

    func addTaskButtonPressed(sender: UIControlEvents) {
        let vcToAdd = AddItemViewController()
        self.navigationController?.pushViewController(vcToAdd, animated: true)
    }

    func setUpUserInterface() {
        // Bar setup
        let addTaskButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTaskButtonPressed))
        self.navigationItem.rightBarButtonItem = addTaskButton
        self.navigationItem.title = "To Do List"
        
        // Table setup
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

