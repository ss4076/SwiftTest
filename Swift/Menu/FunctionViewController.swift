//
//  FunctionViewController.swift
//  SwiftTest
//
//  Created by dong jun park on 16/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit

class FunctionViewController: UIViewController {
    // 파라메터 없는 함수,파라메터가 없고 리턴값이 없는 함수 반환
    func greeting()->()->() {
        func say() {
            print("say yoo")
        }
        return say
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ret = greeting()
        ret()
        
        
        print(underscoreCode(person: "박동준", day: "토요일"))
        print(underscoreCode1("박동준","토요일"))
        // Do any additional setup after loading the view.
        // 일반 함수 -1
        print(self.greetAgain(person: "djpark"))
        
        // 반환값이 여려개인 함수 -2
        let numbers = [8, -6, 2, 109, 3, 81]
        
        
        if let tuple = minMax(array:numbers) {
            print ("min: \(tuple.min)/ max: \(tuple.max)")// tuple의 값이 존재한다면 해당 값이 출력됩니다.
        } else {
            print("array empty")
        }
        // 매개변수 이름 -3
        self.someFunction(firstParameterName: "1", secondParameterName: "2")
        // 인자 레이블 -4
        print(self.somFunction1(personName: "djpark", from: "seoul"))
        // 인자 레이블 생략하기 -5
        self.somFunction2("djpark", secondParameterName: "khpark")
        
        // 기본 매개변수 값 -6
        self.someFunction3(parameterWithoutDefault: 3, parameterWithDefault: 6)
        self.someFunction3(parameterWithoutDefault: 10)
        
        // 입출력 파라메터 in-out -7
        var first = 3
        var second = 107
        self.swapTwoInts(first: &first, second: &second)
        print("first : \(first) / second : \(second)")
        
        
        // 함수타입 -8
        var function: (Int, Int) ->Int
        function = multiplyTwoInts(_:_:)
        print("multiplyTwoInts \(function(2,3))")
        
        // 매개변수 타입처럼 사용하는 함수타입 -9
        self.printMathResult(multiplyTwoInts, 3, 5)
        
        // 변환 타입처럼 사용하는 함수타입 -10
        let ret1 = self.chooseStepFunction(backward: true)
        ret1(1)
        
        // 중첩함수 -11
        var currentValue = -4
        let moveNearerToZero = chooseStepFunction1(backward: currentValue > 0)
        while currentValue != 0 {
            print("\(currentValue)...")
            currentValue = moveNearerToZero(currentValue)
        }
        print("zero!")
    }
    // 중첩함수 -11
    func chooseStepFunction1(backward:Bool) -> (Int) -> (Int) {
        func stepForward(input:Int) -> Int {
            return input+1
        }
        func stepBackward(input:Int) -> Int {
            return input-1
        }
        return backward ? stepBackward : stepForward
    }
    
    // 변환 타입처럼 사용하는 함수타입 -10
    func stepForward(_ input: Int) -> Int {
        let result = input+1
        print("stepForward result \(result)")
        return result
    }
    func stepBackward(_ input: Int) -> Int {
        let result = input-1
        print("stepBackward result \(result)")
        return result
    }
    func chooseStepFunction(backward: Bool) -> (Int) -> Int {
        return backward ? stepBackward:stepForward
    }
    
    
    // 함수타입 -8
    func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
        return a * b
    }
    
    // 매개변수 타입처럼 사용하는 함수타입 -9
    func printMathResult(_ mathFunction:(Int, Int)-> Int, _ a: Int, _ b: Int) {
        print("Result: \(mathFunction(a,b))")
    }
    
    // 일반 함수 -1
    func greetAgain(person:String)->String {
        return "Hello again, "+person+"!"
    }
    // 반환 값이 여러개인 함수 -2
    func minMax(array:[Int]) -> (min:Int, max: Int)? {
        var currentMin = array.first!
        var currentMax = array.first!
        
        for value in array {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    // 매개변수 이름 -3
    func someFunction(firstParameterName: String, secondParameterName: String) {
        
    }
    
    // 인자 레이블 -4
    func somFunction1(personName parameterName: String, from hometown: String) -> String {
        return "hello! \(parameterName)!, glad you could visit from \(hometown)"
    }
    
    // 인자 레이블 생략하기 -5
    func somFunction2(_ firstParameterName: String, secondParameterName: String) {
        
    }
    // 기본 매개변수 값 -6
    func someFunction3(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
        
    }
    // 입출력 파라메터 in-out -7
    func swapTwoInts(first a: inout Int, second b: inout Int) {
        let temp = a
        a = b
        b = temp
    }
    
    
    /* 언더스코어 사용 예제 */
    func underscoreCode(person: String, day:String)->String {
        return "Hellow \(person), today is \(day)."
    }
    
    func underscoreCode1(_ person: String,_ day:String)->String {
        return "Hellow \(person), today is \(day)."
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
