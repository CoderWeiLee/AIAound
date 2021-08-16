//
//  Common.swift
//  AISound
//
//  Created by 李伟 on 2021/8/16.
//

import UIKit
////适配iPhoneX
//获取底部的安全距离，全面屏手机为34pt，非全面屏手机为0pt
//底部的安全距离
let bottomSafeAreaHeight = UIApplication.shared.windows.first?.safeAreaInsets.bottom ?? 0.0

//顶部的安全距离
let topSafeAreaHeight = (bottomSafeAreaHeight == 0 ? 0 : 24)

let window = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
let height = window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

//导航栏高度
let navigationHeight = (bottomSafeAreaHeight == 0 ? 64 :88)

//tabbar 高度
let tabBarHeight = (bottomSafeAreaHeight + 49)
