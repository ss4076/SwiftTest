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
    
}

