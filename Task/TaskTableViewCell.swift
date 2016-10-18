//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Chan Hee Park on 10/13/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {
    var task: Task? = nil
    convenience init(style: UITableViewCellStyle, reuseIdentifier: String?, task: Task) {
        self.init(style: style, reuseIdentifier: reuseIdentifier)
        self.task = task
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
    }
    
    

}
