//
//  StatViewController.swift
//  Task
//
//  Created by Chan Hee Park on 10/13/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

class StatViewController: UIViewController {
    var completionLabel: UILabel?

    
    convenience init(numberOfCompletion: Int) {
        self.init()
        self.completionLabel = UILabel()
        self.completionLabel?.text = String(numberOfCompletion)
        self.navigationItem.title = "Statistic"
        self.view.backgroundColor = UIColor.white
        self.setUpUserInterface()
    }
    
    func setUpUserInterface() {
        
        self.completionLabel?.textAlignment = .center
        self.completionLabel?.adjustsFontSizeToFitWidth = true
        self.navigationItem.title = "Statistic"
        self.view.addSubview(completionLabel!)
        
        self.completionLabel?.translatesAutoresizingMaskIntoConstraints = false
        self.completionLabel?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.completionLabel?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.completionLabel?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        self.completionLabel?.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
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
