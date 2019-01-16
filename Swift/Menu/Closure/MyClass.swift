//
//  MyClass.swift
//  SwiftTest
//
//  Created by dong jun park on 16/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit



class MyClass: NSObject {
    var completionHandlers:[()->()] = []
    var x = 10
    override init() {}
    init(x:Int) {
//        super.init()
        self.x = x
//        checkUnderTen() { (result) in
//            guard result == true else {
//                print("got it 2")
//                return
//            }
//            print("got it 1")
//        }
    }
    
//    func checkUnderTen(closure:@escaping(_ res:Bool)->()) {
//        closure(true)
//    }
    
    func withEscaping(completion:@escaping() -> Void) {
        // 함수 밖에 있는 completionHandlers 배열에 해당 클로저를 저장
        completionHandlers.append(completion)
    }
    
    func withoutEscaping(completion:() -> Void) {
        completion()
    }
    
    func callFunc() {
        withEscaping() { () in
            self.x = 100
        }
        
        withoutEscaping() { () in
            self.x = 200
        }
    }
  
}
