//
//  AILoginManager.swift
//  AISound
//
//  Created by 李伟 on 2021/8/19.
//

import Foundation
class AILoginManager: NSObject {
    var currentUser: AIUser?
    var login = false
    static let sharedLoginManager: AILoginManager = {
       let instance = AILoginManager()
       instance.login = UserDefaults.standard.bool(forKey: kUserLoginKey)
       return instance
    }()
}
