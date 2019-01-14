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
    
    override func viewDidLoad() {
        alamofireTest()
        
        grammerTest()
        
        
    }
    func alamofireTest() {
        Alamofire.request(
            "https://mguarddev.raonsecure.co.kr:8802/all/insertAuditLogs.do",
            method: .post,
            parameters: ["deviceId":"G6VVNFVYJCLH", "source":"AGENT", "timestamp":"1543396294327", "shorTimestamp":"1543396294327", "type":"AUTH", "action":"LOGIN","auth":"djpark", "auditLogDesc":"Login Success", "companyKey":"1"],
            encoding: URLEncoding.default,
            headers: ["Content-Type":"application/json", "Accept":"application/json"]
            )
            .validate(statusCode: 200..<300)
            .responseJSON {response in
                if let JSON = response.result.value {
                    print(JSON)
                } else {
                    print("response: \(response.description)")
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
}
