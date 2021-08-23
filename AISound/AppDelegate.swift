//
//  AppDelegate.swift
//  AISound
//
//  Created by 李伟 on 2021/7/31.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window?.backgroundColor = .white
        AILoginManager.sharedLoginManager.login = defaults.value(forKey: loginKey) as? Bool ?? false
        if AILoginManager.sharedLoginManager.login {
            AILoginManager.sharedLoginManager.currentUser = defaults.getCustomObject(forKey: currentUserKey) as? AIUser
            let nav = UINavigationController(rootViewController: AITabbarController())
            nav.navigationBar.isHidden = true
            window?.rootViewController = nav
        }else {
            let welVc = WelcomeViewController()
            let nav = UINavigationController(rootViewController: welVc)
            nav.navigationBar.isHidden = true
            window?.rootViewController = nav
        }
        window?.makeKeyAndVisible()
        return true
    }

}

extension UserDefaults {
    func saveCustomObject(customObject object: NSCoding, key: String) {
        let encodedObject = try? NSKeyedArchiver.archivedData(withRootObject: object, requiringSecureCoding: true)
        setValue(encodedObject, forKey: key)
        synchronize()
    }
    
    func getCustomObject(forKey key: String) -> AnyObject? {
        let decodedObject = object(forKey: key) as? Data
        if let decoded = decodedObject {
            let object = try? NSKeyedUnarchiver.unarchivedObject(ofClass: AIUser.self, from: decoded)
            return object
        }
        return nil
    }
}

