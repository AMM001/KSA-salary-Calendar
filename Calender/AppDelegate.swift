//
//  AppDelegate.swift
//  Calender
//
//  Created by mac on 8/21/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
            window = UIWindow(frame: UIScreen.main.bounds)

            // here you have the chance to change your rootview controller
        
            if(UserDefaults.standard.bool(forKey: "notFirstInApp") == false){
                UserDefaults.standard.set(true, forKey: "notFirstInApp")
                
                let stb = UIStoryboard(name: "Main", bundle: nil)
                let walkthrough = stb.instantiateViewController(withIdentifier: "Master") as! BWWalkthroughViewController
                let page_one = stb.instantiateViewController(withIdentifier: "page1") as UIViewController
                let page_two = stb.instantiateViewController(withIdentifier: "page2") as UIViewController
                let page_three = stb.instantiateViewController(withIdentifier: "page3") as UIViewController
                
                // Attach the pages to the master
                
                walkthrough.add(viewController:page_one)
                walkthrough.add(viewController:page_two)
                walkthrough.add(viewController:page_three)
                
                
                
                window?.rootViewController  = walkthrough
                window?.makeKeyAndVisible()
                
             
            }else{
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let rootViewController1 = storyboard.instantiateViewController(withIdentifier: "ViewControllertabBar") as! ViewControllertabBar
                
                let navigationController = UINavigationController(rootViewController: rootViewController1)
                navigationController.navigationBar.isTranslucent = false
                 navigationController.navigationBar.barTintColor = UIColor.init(red: 255, green: 255, blue: 255, alpha: 1)
                
                 UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.gray, NSFontAttributeName: UIFont(name: "DroidArabicKufi", size: 20)!]
                window?.rootViewController = navigationController
                window?.makeKeyAndVisible()
               
            }

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

