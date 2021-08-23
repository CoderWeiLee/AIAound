//
//  AITabbarViewController.swift.swift
//  AISound
//
//  Created by 李伟 on 2021/8/23.
//

import UIKit
class AITabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let nav1 = UINavigationController(rootViewController: RecordViewController())
        let nav2 = UINavigationController(rootViewController: FileViewController())
        let nav3 = UINavigationController(rootViewController: FeedbackViewController())
        let nav4 = UINavigationController(rootViewController: MeViewController())
        let tabbar1 = UITabBarItem(title: "Record", image: UIImage(systemName: "arrowtriangle.right.circle"), selectedImage: UIImage(systemName: "arrowtriangle.right.circle"))
        let tabbar2 = UITabBarItem(title: "File", image: UIImage(systemName: "text.justify"), selectedImage: UIImage(systemName: "text.justify"))
        let tabbar3 = UITabBarItem(title: "Feedback", image: UIImage(systemName: "bubble.right"), selectedImage: UIImage(systemName: "bubble.right"))
        let tabbar4 = UITabBarItem(title: "Me", image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person"))
        nav1.tabBarItem = tabbar1
        nav2.tabBarItem = tabbar2
        nav3.tabBarItem = tabbar3
        nav4.tabBarItem = tabbar4
        addChild(nav1)
        addChild(nav2)
        addChild(nav3)
        addChild(nav4)
        tabBar.barTintColor = .black
        nav1.navigationBar.isHidden = true
        nav2.navigationBar.isHidden = true
        nav3.navigationBar.isHidden = true
        nav4.navigationBar.isHidden = true
    }
}
