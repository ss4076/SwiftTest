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
        
//        746381295[0]
//        746381295[1]
        
         print("현재의 myInt 값은\(yourInt)입니다")
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
        
//        a = Reactive(1)
        
/*
        let op = self.optionalCode
        print(op())
//        self.closureCode(message: op)
        let result = self.closureCode(message: "요꼬아빠")
        print(result("동준","박"))
        let ret = greeting()
        ret()
        
        print(underscoreCode(person: "박동준", day: "토요일"))
        print(underscoreCode1("박동준","토요일"))
       */
        
//        let two = (2,"two")
//        let item = two.2
//        let three = (num:3, eng:"three")
//        let item = three.num
//        let (one, _, three) = (1,2,3)
        
//        var r = add(1,2)
//        print(r)
        
        
        
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

