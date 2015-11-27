//
//  LoginController.swift
//  RedditReader
//
//  Created by Vagmi on 27/11/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import UIKit
import SafariServices

class LoginController: UIViewController, SFSafariViewControllerDelegate {
  let kClientId = "p0ApyFnjqVHLpg"
  let kRedirectUri = "redditreader://somethingorblank"
  static let kNotification = "CloseSafariReddit"
  var safariController:SFSafariViewController?

  @IBOutlet weak var txtUsername: UITextField!

  @IBOutlet weak var txtPassword: UITextField!
  
  override func viewDidLoad() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "finishLogin:", name: LoginController.kNotification, object: nil)
  }
  
  @IBAction func doLogin(sender: UIButton) {
    let url = "https://ssl.reddit.com/api/v1/authorize?client_id=\(kClientId)&response_type=code&state=TEST&redirect_uri=\(kRedirectUri)&duration=permanent&scope=read"
    let sfUrl = NSURL(string: url)
    safariController = SFSafariViewController(URL: sfUrl!)
    safariController!.delegate = self
    self.presentViewController(safariController!, animated: true, completion: nil)
  }
  
  func safariViewControllerDidFinish(controller: SFSafariViewController) {
    controller.dismissViewControllerAnimated(true, completion: nil)
  }
  
  func finishLogin(notification: NSNotification) {
    let url = notification.object as! NSURL
    NSLog(url.query!)
    let codePart = url.query?.componentsSeparatedByString("&").filter({ (part) -> Bool in
      return part.hasPrefix("code=")
    })
    let code = codePart![0].componentsSeparatedByString("=")[1]
    NSLog("code is \(code)")
    safariController?.dismissViewControllerAnimated(true, completion: nil)
  }
}
