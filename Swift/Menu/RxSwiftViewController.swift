//
//  RxSwiftViewController.swift
//  SwiftTest
//
//  Created by dong jun park on 15/01/2019.
//  Copyright © 2019 djpark. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {
    
    var viewModel = ViewModel()
    var disposeBag = DisposeBag()
    
    @IBOutlet weak var rxLabel: UILabel!
    @IBOutlet weak var btnBind: UIButton!
    
    
    func myJust<E>(element: E) -> Observable<E> {
        
        return Observable.create{ observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func reactiveCodeTest() {
        
        myJust(element:"My just observable")
            .subscribe { s in
                print(s)
        }
        
        let stringSequence = Observable.just("This is stirng yo")
        let oddSequence = Observable.from([1,3,5,7,9])
        let dictSequence = Observable.from([1:"Rx", 2:"Swift"])
        
        /*
         subscribe(on: (Event<String>) -> Void)
         */
        _ = stringSequence.subscribe { (event: Event<String>) in
            print(event)
        }
        
        
        _ = oddSequence.subscribe { (event: Event<Int>) in
            print(event)
        }
        
        _ = dictSequence.subscribe { (event: Event<(key: Int, value: String)>) in
            print(event)
        }
        
        let disposeBag1 = DisposeBag()
        
        let stringSequence1 = Observable.just("Rxswift Observable")
        
        let subscription4 = stringSequence1.subscribe { (event: Event<String>) in
            print(event)
        }
        
        //subscription을 disposeBag에 넣어 메모리를 해제
        subscription4.disposed(by: disposeBag1)
        
        // 메모리를 해제하는 다른 방법
        stringSequence1.takeUntil(self.rx.deallocated).subscribe {
            print($0)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reactiveCodeTest()
        
        bind()
    }
    
    func bind() {
        
        self.viewModel.outputs.number.subscribe(onNext: { number in
            print(number)
            self.rxLabel.text = String(number)
        })
        .disposed(by: disposeBag) // 메모리 해제
        
        self.btnBind.rx.tap
            .subscribe(onNext: viewModel.inputs.bindBtnViewModel) //Observable 값을 구독
            .disposed(by: disposeBag)  // 메모리 해제
    }
    
    @IBAction func btnBindAction(_ sender: Any) {
        print("btnBindAcion")
    }
}
