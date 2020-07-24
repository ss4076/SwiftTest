//
//  SwiftTests.swift
//  SwiftTests
//
//  Created by djpark on 2017. 10. 21..
//  Copyright © 2017년 djpark. All rights reserved.
//

import XCTest
@testable import SwiftTest
class SwiftTests: XCTestCase {
    
    var manager : TodoManager!  //! nil값을 기본으로 가지는 변수
    
    func justDoit() -> Bool {
        return true
    }
    
    func add(_ n1:Int, _ n2:Int) -> Int {
        return n1+n2
    }
    
    func increaseOne(_ n1:Int) -> Int {
        return n1+1
    }
    
    // 테스트 준비코드 작성, 테스트 메소드가 동작하기 전에 호출
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        manager = TodoManager.shared
    }
    
    func testAddTodo() {
        manager.addTodo("Todo1", "date1")
        manager.addTodo("Todo2", "date2")
        XCTAssertEqual(manager.count, 2)
    }
    
    // 테스트 마무리 코드 작성, 테스트 메소드 동작이 끝난뒤에 호출
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    // 유닛테스트, 반환값/파라미터 없이 test라는 이름으로 시작
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testA() {
        XCTAssert(justDoit(), "Should return true") // bool
        XCTAssertEqual(add(1,2),3,"1+2 should be 3") // return 3자리 결과
        XCTAssertGreaterThan(increaseOne(10), 10, "10+1 > 10")
    }
    
    
    func testB() {
        // 비동기 테스트 작성
        let expectation:XCTestExpectation = self.expectation(description: "Publish")
        manager.publshTodos {
            XCTAssertTrue(true)
            // 대기 상태 종료
            expectation.fulfill()
        }
        waitForExpectations(timeout:1.0, handler:nil)
    }
    
    // 시간 측정
    func testC() {
        self.measure {
            manager.saveTodos()
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testGrammer1() {

        /*
         optional값이 있을 수도 있고 없을 수도 있다.
         왜? nil의 가능성을 명시적으로 표현
         전달받은 값이 nil 체크안해도 됨
         예외 사항을 최소화 할수있는 안전한 코딩
         
         ? 와 !
         
         1. ! : 암시적 추출 옵셔널
         2. ? : 일반 타입과 다르기 때문에 연산 제한 됨
         */
        
        var optionalValue: Int? = 100
        
//        optionalValue = optionalValue + 1
        
//        optionalValue = nil
        // nil로 인한 런타임 에러 발생
//        optionalValue = optionalValue + 1
        
        switch optionalValue {
        case .none:
            print("This Optional variable is nil")
        case .some(let value):
            print("Value is \(value)")
        }
        
        self.someFouc(param: nil)

    }
    
    func someFouc(param: Int?) {
        
    }
    
    
    func testGrammer2() {
    
        /*
         꺼내는 법
         1. 옵셔널 바인딩
          - nil체크 + 안전한 값추출
         2. 강제 추출
          - 값을 강제로 추출
         
         옵셔널 활용
         */
        
        let myName: String? = "djpark0402"
        
        // name 상수는 if-let 구문 내에서만 사용가능(바인딩)
        if let name: String = myName {
            printName(name)
        } else {
            print("myName = nil")
        }
    }

    func printName(_ name: String) {
        print(name)
    }
    
    
    func testGrammer3() {
        
        print(speak(I: "you", am: "are", name: "oms"))
    }
    
    func speak(I i:String, am:String, name:String) -> String {
        return "\(i) \(am) \(name)"
    }
}

