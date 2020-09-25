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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // 1
        //2
        //3
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
        // bugfix-1
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        // ims-1 (1주일 정도)
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.

        // f-2 개발끝

        // ims-2 끝

    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // ims-3.1
        // ims-3.2
    }


}

