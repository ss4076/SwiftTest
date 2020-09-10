//
//  IWAuthenticatorSetting.swift
//  SwiftTest
//
//  Created by raonsecure on 2020/09/10.
//  Copyright © 2020 djpark. All rights reserved.
//

import UIKit

class IWAuthenticatorSetting: NSObject {
    
    static func setAuthMessage(message: String) -> Void {
        
        UserDefaults.standard.set(message, forKey: "auth_message")
    }
    
    static func getAuthMessage() -> String {
        
        return UserDefaults.standard.object(forKey: "auth_message") as! String
    }
}
