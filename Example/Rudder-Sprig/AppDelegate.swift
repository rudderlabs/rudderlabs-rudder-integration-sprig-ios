//
//  AppDelegate.swift
//  Rudder-Sprig
//
//  Created by Satheesh Kannan on 10/06/24.
//

import UIKit
import Rudder
import Rudder_Sprig

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if let path = Bundle.main.path(forResource: "RudderConfig", ofType: "plist") {
            
            let url = URL(fileURLWithPath: path)
            guard let rudderConfig = RudderConfig.create(from: url) else { return true }
            
            let configBuilder = RSConfigBuilder()
                .withDataPlaneUrl(rudderConfig.PROD_DATA_PLANE_URL)
                .withLoglevel(RSLogLevelVerbose)
                .withFactory(RudderSprigFactory.instance)
                .withTrackLifecycleEvens(false)
            
            RSClient.getInstance(rudderConfig.WRITE_KEY, config: configBuilder.build())
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

