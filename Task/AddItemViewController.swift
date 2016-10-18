//
//  AddItemViewController.swift
//  Task
//
//  Created by Chan Hee Park on 10/13/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate {
    func didFinishAddingTask(taskName: String, taskDetail: String)
}
class AddItemViewController: UIViewController {
    let taskName: UITextField = UITextField()
    let taskDetail: UITextField = UITextField()
    var delegate:AddItemViewControllerDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUserInterface()
        
    }
    
   
    func setUpUserInterface() {
        self.navigationItem.title = "Add Task"
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        self.navigationItem.rightBarButtonItem = doneButton
        self.view.backgroundColor = UIColor.white
        
        // ** Add textfields **
        taskName.placeholder = "Task Name"
        taskName.borderStyle = .roundedRect
        
        taskDetail.placeholder = "Task Detail"
        taskDetail.borderStyle = .roundedRect
        
        
        self.view.addSubview(taskName)
        self.view.addSubview(taskDetail)
        
        // ** Constraints **
        taskName.translatesAutoresizingMaskIntoConstraints = false
        taskName.heightAnchor.constraint(equalToConstant: 40).isActive = true
        taskName.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        taskName.topAnchor.constraint(equalTo: self.view.topAnchor, constant: (self.navigationController?.navigationBar.frame.height)! + 40).isActive = true
        taskName.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        taskDetail.translatesAutoresizingMaskIntoConstraints = false
        taskDetail.heightAnchor.constraint(equalToConstant: 80).isActive = true
        taskDetail.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.size.width - 40).isActive = true
        taskDetail.topAnchor.constraint(equalTo: taskName.bottomAnchor, constant: 20).isActive = true
        taskDetail.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        
        
        
    }
    
    func donePressed(sender: UIControlEvents) {
        // transfer data to main view
        self.delegate?.didFinishAddingTask(taskName: taskName.text!, taskDetail: taskDetail.text!)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
