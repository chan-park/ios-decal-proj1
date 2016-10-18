//
//  Task.swift
//  Task
//
//  Created by Chan Hee Park on 10/14/16.
//  Copyright © 2016 Chan Hee Park. All rights reserved.
//

import UIKit

class Task: NSObject {
    var title: String?
    var detail: String?
    var completed: Bool = false
    var timer: Timer?
    var TTL: Int
    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        self.TTL = 24 * 60 * 60
    }
    
    func isCompleted() -> Bool {
        return completed
    }
    
    func completeTask() {
        
    }
}
