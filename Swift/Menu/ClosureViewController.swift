//
//  ViewController.swift
//  Swift
//
//  Created by djpark on 2017. 10. 21..
//  Copyright © 2017년 djpark. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ClosureViewController: UIViewController {
//    var count : Int = 0
    var count = 5 {
        didSet {
            if downBtn != nil {
                downBtn.isEnabled = count > 0
                upBtn.isEnabled = count < 10
                countLbl.text = String(count)
            }
        }
    }
    
    @IBOutlet weak var upBtn: UIButton!
    @IBOutlet weak var downBtn: UIButton!
    @IBOutlet weak var countLbl: UILabel!
    
    @IBAction func upBtnAction() {
        self.count += 1
        self.countLbl.text = "\(self.count)"
    }
    @IBAction func downBtnAction() {
        self.count -= 1
        self.countLbl.text = "\(self.count)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        countLbl.text = String(count)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let mc = MyClass()
        mc.callFunc()
        print("mc.x: \(mc.x)")
        
        mc.completionHandlers.first?()
        print("mc.x: \(mc.x)")
        
        
        // 명령형(imperative) 프로그래밍
        let myScore = ["A", "A","A","B","D"]
        var happyScore:[String] = []
        for grade in myScore {
            if grade == "A" {
                happyScore.append(grade)
            } else {
                print("엄마는 행복하지 않았다")
            }
        }
        print(happyScore)
        
        // 선언형(Declarative) 프로그래밍
//        stringFilter(grade:myScore, returnBool:{$0 == "A"})
        
        // 반응형(reactive) 프로그래밍
        let a = 1
        let b = 3
        print("a+b = \(a+b)")

        
//        self.closureCode(message: op)
        let result = self.closureCode(message: "요꼬아빠")
        print(result("동준","박"))
        
        
        //
        hello()
        
        // 이름이 없음-> 익명함수라고 함
        ({() -> () in
            print("안녕하셉")
        })()
      
        let res = ({(num:Int, message:String)-> Bool in
            guard num < 10 else {
                print("message :\(message)")
                return false
            }
            print("message :\(message)")
            return true
        })(9, "i got it")
        
        print("result: \(res)")
        
        self.checkUnderTen(num: 11, message: "choi") { (result) in
            guard result == true else {
                print("got it 2")
                return
            }
            print("got it 1")
//            if result == true {
//                print("got it 1")
//            }
//            else {
//                print("got it 2")
//            }
        }
        
        print("result: \(res)")
        
        print("==========================")
        let list = 1...100
        
        let r = list.reduce(0) { (r, element) -> Int in
            return r + element
        }
        print(r)
        
        
    }
    // sung hun
    func checkUnderTen(num: Int, message: String, closure:@escaping(_ result:Bool)->()) {
        guard num < 10 else {
            print("message :\(message)")
            closure(true)
            return;
        }
        print("message :\(message)")
        closure(false)
        return ;
    }
    // djpark
    func checkUnderTen(num: Int, message: String) -> Bool {
        guard num < 10 else {
            print("message :\(message)")
            return false
        }
        print("message :\(message)")
        return true
    }
    
    func hello() {
        print("안녕하셍")
    }
    
    func add(_ i:Int, _ j:Int) -> Int{
//        print("sum=\(i+j)")
        return i+j
    }
  
    
   
    
    /*클로저 사용 예제*/
    func closureCode(message: String) -> (String, String) -> String {
        // {(PARAMETERS)-> RETURN_TYPE in Code}
        return { (firstName: String, lastName: String) -> String in
            return lastName + firstName + message
        }
    }
    
    func closureCode1(message: String) -> (String, String) -> String {
        return { (firstName, lastName) -> String in
            return lastName + firstName + message
        }
    }
    
    func closureCode2(message: String) -> (String, String) -> String {
        return {
            return $1 + $0 + message
        }
    }
    
    func closureCode3(message: String) -> (String, String) -> String {
        return {$1 + $0 + message}
    }
    
   
   
}

