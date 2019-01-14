//
//  AppDelegate.swift
//  Swift
//
//  Created by djpark on 2017. 10. 21..
//  Copyright © 2017년 djpark. All rights reserved.
//

import UIKit


extension Character {
    enum Kind {
        case Vowel, Consonant, Other
    }
    
    var kind: Kind {
        switch String(self).lowercased() {
        case "a", "e", "i", "o", "u":
            return Character.Kind.Vowel // .Vowel
        case "b","c","d","f","g","h","j","k","l","m",
             "n","p","q","r","s","t","v","w","x","y","z":
            return .Consonant
        default:
            return .Other
        }
    }
}





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

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

    func makeIncrementor(forIncrement amount: Int)->()->Int {
        var runningTotal = 0
        func incrementor() -> Int {
            runningTotal += amount
            return runningTotal
        }
        return incrementor
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let incrementByTen = makeIncrementor(forIncrement: 10)
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        print("\(incrementByTen())")
        let incrementBySeven = makeIncrementor(forIncrement: 7)
        print("\(incrementBySeven())")
        print("\(incrementByTen())")
        
        
        
        printLetterKinds(word: "Hello")
        
       
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

