//
//  GrammerViewController.swift
//  SwiftTest
//
//  Created by djpark on 14/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit
import Alamofire
import JSON


class GrammerViewController: UIViewController {
    @IBOutlet weak var requestUrlLbl: UILabel!
    @IBOutlet weak var requestBtn: UIButton!
    
    @IBOutlet weak var responseCodeLbl: UILabel!
    @IBOutlet weak var responseMessageLbl: UILabel!
    
    func makeIncrementor(forIncrement amount: Int)->()->Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    func printLetterKinds(word: String) {
        print("\(word)는 다음과 같은 모음과 자음으로 구성되어 있다.")
        for character in word {
            switch character.kind {
            case .Vowel:
                print("모음")
            case .Consonant:
                print("자음")
            case .Other:
                print("기타")
            }
        }
    }
    func grammerTest() {
        // 튜플
        var one = (1, "one", "일")
        print("one.2 \(one.2)")
        one.2 = "하나"
        print("one.2 \(one.2)")
        
        let two = (num:2, eng:"two", kor:"둘")
        print("two.num \(two.num)")
        print("two.kor \(two.kor)")
        
        // 배열 - 초기화
        var intArray:[Int] = [1,2,3,4,5]
        let strArrat:[String] = ["A","B","C"]
        let floatArray = Array<Float>([1.1, 2.2, 3.3])
        
        // 공백 배열
        var emptyArray = [Int]()
        var emptyArray2 = Array<Double>()
        var emptyArray3:[String] = []
        
        let element1 = intArray[0]
        let element2 = floatArray[1]
        
        print("element1 \(element1)")
        print("element2 \(element2)")
    }
    func convertStringInt() {
        // String -> Int
        let nIntVal:UInt? = UInt("100")
        if let nIntVal2:UInt = nIntVal {
            print("nIntVal: \(nIntVal2)")
        }
        
        // UInt64 Type
        //        let nIntVal:UInt64? = UInt64("200")
        //        if let nIntVal2:UInt64 = nIntVal
        //        {
        //            // some coding..
        //        }
        
        // Int -> String
        let strVal:String? = String(123)
        if let strVal2 = strVal {
            print("strVal: \(strVal2)")
        }
    }
    
    @IBAction func requestBtnAction(_ sender: Any) {
        alamofireTest()
    }
    
    func alamofireTest() {
        Alamofire.request(
            self.requestUrlLbl.text as String!,
            method: .post,
            parameters: nil/*["deviceId":"G6VVNFVYJCLH", "source":"AGENT", "timestamp":"1543396294327", "shorTimestamp":"1543396294327", "type":"AUTH", "action":"LOGIN","auth":"djpark", "auditLogDesc":"Login Success", "companyKey":"1"]*/,
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json;charset=UTF-8","Accept":"application/json"]
            )
            .validate(statusCode: 200..<499)
            .responseJSON {response in
                if let JSON = response.result.value {
                    print(JSON)
                    let response = JSON as! NSDictionary
                    
                    let code = response.object(forKey: "rsp_code")
                    let message = response.object(forKey: "rsp_message")
                    print("code: \(String(describing: code)), message: \(String(describing: message))")
                    self.responseCodeLbl.text = String(describing: code)
                    self.responseMessageLbl.text = String(describing: message)
                    
                } else {
                    print("response: \(response.description)")
                }
        }
    }
    
    override func viewDidLoad() {
        grammerTest()
        
        let incrementByTen = makeIncrementor(forIncrement: 10)
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        let incrementBySeven = makeIncrementor(forIncrement: 7)
        print("\(incrementBySeven())")
        print("\(incrementByTen())")
        
        printLetterKinds(word: "Hello")

        convertStringInt()
        
        
        let value = 15
        guardTest(value: value)
    }
    
    func guardTest(value:Int) {
        if value < 10 {
            print("value 는 10 보다 작다.")
        } else if value == 10 {
            print("value 는 10 이다")
        } else {
            print("value 는 10 보다 크다")
        }
        guard value == 10 else { // 조건이 false일때 아래 코드 실행
            print("Error: value가 10이 아닐때 실행")
            return
        }
        
        print("value 는 10이다")
    }
}
