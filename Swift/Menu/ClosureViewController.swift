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

        let op = self.optionalCode
        print(op())
//        self.closureCode(message: op)
        let result = self.closureCode(message: "요꼬아빠")
        print(result("동준","박"))
        let ret = greeting()
        ret()
        
        print(underscoreCode(person: "박동준", day: "토요일"))
        print(underscoreCode1("박동준","토요일"))
       
        
//        let two = (2,"two")
//        let item = two.2
//        let three = (num:3, eng:"three")
//        let item = three.num
//        let (one, _, three) = (1,2,3)
        
//        var r = add(1,2)
//        print(r)
        
        hello()
        
        // 이름이 없음-> 익명함수라고 함
        ({()->Void in
            print("안녕하셉")
        })()
      
        self.checkUnderTen(num: 11, message: "choi") { (result) in
            if result == true {
                print("got it 1")
            }
            else {
                print("got it 2")
            }
        }
        
        let res = ({(num:Int, message:String)-> Bool in
            guard num < 10 else {
                print("message :\(message)")
                return false
            }
            print("message :\(message)")
            return true
        })(9, "i got it")

        print("result: \(res)")
    }
   
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
  
    
    /* 언더스코어 사용 예제 */
    func underscoreCode(person: String, day:String)->String {
        return "Hellow \(person), today is \(day)."
    }
    
    func underscoreCode1(_ person: String,_ day:String)->String {
        return "Hellow \(person), today is \(day)."
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func greeting()->()->() {
        func say() {
            print("say yoo")
        }
        return say
    }
    
    
    /* 옵셔널 사용 예제 */
    func optionalCode() -> String {
        var optionalEmail:String?
        optionalEmail = "ss4076@naver.com"
        if let email = optionalEmail {
            // 값이 존재한다면 출력
            print(email)
        }
        // 존재하지 않으면 if문 그냥 지나침
        return optionalEmail!
    }
   
}

