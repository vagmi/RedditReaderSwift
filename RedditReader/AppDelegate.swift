//
//  AppDelegate.swift
//  RedditReader
//
//  Created by Vagmi on 27/11/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import UIKit
import ChameleonFramework

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    // Override point for customization after application launch.
    Chameleon.setGlobalThemeUsingPrimaryColor(UIColor.flatBlueColor(), withContentStyle: UIContentStyle.Contrast)
    window?.rootViewController?.setStatusBarStyle(UIStatusBarStyleContrast)
    return true
  }
  func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
    if(url.scheme == "redditreader") {

      NSNotificationCenter.defaultCenter().postNotificationName(LoginController.kNotification, object: url)
      return true
    }
    return false
  }

  func applicationWillEnterForeground(application: UIApplication) {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
  }

  func applicationDidBecomeActive(application: UIApplication) {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
  }

  func applicationWillTerminate(application: UIApplication) {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
  }


}

