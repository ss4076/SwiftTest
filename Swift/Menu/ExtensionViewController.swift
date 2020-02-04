//
//  ExtensionViewController.swift
//  SwiftTest
//
//  Created by djpark on 13/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit
extension Double {
    var km: Double {
        return self * 1_000.0
    }
    
    var m: Double {
        return self
    }
    
    var cm: Double {
        return self/100.0
    }
    
    var mm: Double {
        return self/1_000.0
    }
    
    var tf: Double {
        return self/3.28084
    }
}

extension Int {
    func repetitions(task: ()->()) {
        for _ in 0...self {
            task()
        }
    }
    
    mutating func square() {
        self = self * self
    }
    
    subscript(digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 1...digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
class ExtensionViewController: UIViewController {
    
    override func viewDidLoad() {
        let oneInch = 25.4.mm
        print("1인치는 \(oneInch) 미터입니다")
        
        1.repetitions {
            print("익스텐션의 활용 예.")
        }
        
        2.repetitions {
            print("정수형에 새로운 메서드를 추가")
        }
        let myInt = 3
        print("현재의 myInt 값은\(myInt)입니다")
        
        var yourInt = 3
        yourInt.square()
        print("현재의 myInt 값은\(yourInt)입니다")
    }
}
