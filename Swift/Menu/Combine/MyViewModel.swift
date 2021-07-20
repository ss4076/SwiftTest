//
//  MyModel.swift
//  SwiftTest
//
//  Created by raonsecure on 2020/11/11.
//  Copyright © 2020 djpark. All rights reserved.
//

import UIKit
import Combine

class MyViewModel {
    // published 어노테이션을 통해
    @Published var passwordInput: String = "" {
        didSet {
            print("MyViewModel / passwordInput: \(passwordInput)")
        }
    }
    
    @Published var passwordComfirmInput: String = "" {
        didSet {
            print("MyViewModel / passwordComfirmInput: \(passwordComfirmInput)")
        }
    }
    // 들어온 퍼블리셔들의 값 일치 여부를 반환하는 퍼블리셔
    lazy var isMatchPasswordInput :AnyPublisher<Bool, Never> = Publishers
    .CombineLatest($passwordInput, $passwordComfirmInput)
        .map({ (password: String, passwordConfirm: String) in
            if (password == "" || passwordConfirm == "") {
                return false
            }
            if (password == passwordConfirm) {
                return true
            } else {
                return false
            }
        })
    .print()
    .eraseToAnyPublisher()
}
