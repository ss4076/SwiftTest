//
//  TodoManager.swift
//  SwiftTestTests
//
//  Created by djpark on 2018. 1. 28..
//  Copyright © 2018년 djpark. All rights reserved.
//

import UIKit

class TodoManager:NSObject {
    static let shared : TodoManager = {
        let instance = TodoManager()
        return instance
    }()
    var count : Int
    
    override init() {
//        super.init()
        count = 0
    }
    
//    func TodoManager() {
//        count = 0;
//    }
    
    func addTodo(_ title:String, _ dueDate:NSString) {
        print("title: \(title), duDate: \(dueDate)")
        count += 1;
    }
    
    func publshTodos(_ completion:() -> Void) {
        
    }
    func saveTodos() {
        
    }
    
    
}
