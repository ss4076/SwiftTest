//
//  ViewModel.swift
//  SwiftTest
//
//  Created by dong jun park on 15/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


protocol ViewModelType {
    var inputs: ViewModelInput {
        get
    }
    var outputs: ViewModelOutput {
        get
    }
}

protocol ViewModelInput {
    func bindBtnViewModel()
    func request2()
    func request3()
}

extension ViewModel {
    func bindBtnViewModel() {
        print("viewModel bindBtnViewModel")
    }
    func request2() {
        print("viewModel request2()")
    }
    func request3() {
        print("viewModel request3()")
    }
}

struct Model {
    let number = Variable(100)
}

protocol ViewModelOutput {
    var number: Observable<Int> {
        get
    }
}

class ViewModel: ViewModelInput, ViewModelOutput, ViewModelType {
    let model: Model
    let number: Observable<Int>
    
    var inputs: ViewModelInput {
        return self
    }
    
    var outputs: ViewModelOutput {
        return self
    }
    
    init() {
        self.model = Model()
        self.number = model.number.asObservable()
    }
    
}
