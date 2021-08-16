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
        let nav1 = UINavigationController(rootViewController: RecordViewController())
        let nav2 = UINavigationController(rootViewController: FileViewController())
        let nav3 = UINavigationController(rootViewController: FeedbackViewController())
        let nav4 = UINavigationController(rootViewController: MeViewController())
        let tabVc = UITabBarController()
        let tabbar1 = UITabBarItem(title: "Record", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        let tabbar2 = UITabBarItem(title: "File", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        let tabbar3 = UITabBarItem(title: "Feedback", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        let tabbar4 = UITabBarItem(title: "Me", image: UIImage(named: ""), selectedImage: UIImage(named: ""))
        nav1.tabBarItem = tabbar1
        nav2.tabBarItem = tabbar2
        nav3.tabBarItem = tabbar3
        nav4.tabBarItem = tabbar4
        tabVc.addChild(nav1)
        tabVc.addChild(nav2)
        tabVc.addChild(nav3)
        tabVc.addChild(nav4)
        window?.backgroundColor = .white
        window?.rootViewController = UINavigationController(rootViewController: tabVc)
        window?.makeKeyAndVisible()
        return true
    }

}

