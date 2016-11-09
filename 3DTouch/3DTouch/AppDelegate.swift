//
//  AppDelegate.swift
//  3DTouch
//
//  Created by 彭盛凇 on 16/10/17.
//  Copyright © 2016年 huangbaoche. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //判断是否为3Dtouch进入App
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        //解决循环push问题
        let nav = window?.rootViewController as? UINavigationController
        
        if  nav!.viewControllers.count > 1 {
            nav!.popToRootViewController(animated: false)
        }
        
        switch shortcutItem.type {
        case "one":
            print("使用3D Touch 点击了第一个选项")
            nav?.pushViewController(OnceViewController(), animated: true)
            
        case "two":
            print("使用3D Touch 点击了第二个选项")
            nav?.pushViewController(SecondViewController(), animated: true)
            
        case "three":
            print("使用3D Touch 点击了第三个选项")
            nav?.pushViewController(ThirdViewController(), animated: true)
            
        case "four":
            print("使用3D Touch 点击了第四个选项")
            nav?.pushViewController(FourthViewController(), animated: true)
            
        default:
            print("扯犊子~")
        }
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        let nav = UINavigationController(rootViewController: ViewController())
        
        window?.rootViewController = nav
        
        //设置3Dtouch标签项
        
        setupShortcut()
        
        return true
    }
    
    func setupShortcut() {
        
        /*
         typedef NS_ENUM(NSInteger, UIApplicationShortcutIconType) {
         
         UIApplicationShortcutIconTypeCompose,//编辑的图标
         UIApplicationShortcutIconTypePlay,//播放图标
         UIApplicationShortcutIconTypePause,//暂停图标
         UIApplicationShortcutIconTypeAdd,//添加图标
         UIApplicationShortcutIconTypeLocation,//定位图标
         UIApplicationShortcutIconTypeSearch,//搜索图标
         UIApplicationShortcutIconTypeShare//分享图标
         UIApplicationShortcutIconTypeProhibit       NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeContact        NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeHome           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeMarkLocation   NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeFavorite       NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeLove           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeCloud          NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeInvitation     NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeConfirmation   NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeMail           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeMessage        NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeDate           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeTime           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeCapturePhoto   NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeCaptureVideo   NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeTask           NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeTaskCompleted  NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeAlarm          NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeBookmark       NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeShuffle        NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeAudio          NS_ENUM_AVAILABLE_IOS(9_1),
         UIApplicationShortcutIconTypeUpdate         NS_ENUM_AVAILABLE_IOS(9_1)
         } NS_ENUM_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED;
         */
        
        /*
         - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
         
         也需要进行一下判断，在launchOptions中有UIApplicationLaunchOptionsShortcutItemKey这样一个键，通过它，我们可以区别是否是从标签进入的app，如果是则处理结束逻辑后，返回NO，防止处理逻辑被反复回调。
         
         几点注意：
         
         1、快捷标签最多可以创建四个，包括静态的和动态的。
         
         2、每个标签的题目和icon最多两行，多出的会用...省略
         
         */
        
        let icon = UIApplicationShortcutIcon(type: UIApplicationShortcutIconType.play)
        
        let item = UIApplicationShortcutItem(type: "four", localizedTitle: "叫爸爸2", localizedSubtitle: "点我吧~", icon: icon, userInfo: nil)
        
        UIApplication.shared.shortcutItems = [item]
        
    }
}

