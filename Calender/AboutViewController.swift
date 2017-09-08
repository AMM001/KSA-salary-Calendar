//
//  AboutViewController.swift
//  Calender
//
//  Created by mac on 8/25/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func aboutbt(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    

    @IBAction func twitterbt(_ sender: Any) {
        
       if let url = NSURL(string: "https://twitter.com/ibtikar_tech?lang=en"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    
    @IBAction func facebookbt(_ sender: Any) {
        
        if let url = NSURL(string: "https://www.facebook.com/Ibtikar.Technologies.Co/"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    
    @IBAction func sitebt(_ sender: Any) {
        
        if let url = NSURL(string: "https://ibtikar.net.sa/"){ UIApplication.shared.open(url as URL, options: [:], completionHandler: nil) }
    }
    
    
    
    
    
    
    
    
}


//
//
//extension UIApplication {
//    class func tryURL(urls: [String]) {
//        let application = UIApplication.shared
//        for url in urls {
//            if application.canOpenURL(NSURL(string: url)! as URL) {
//                application.openURL(NSURL(string: url)! as URL)
//                return
//            }
//        }
//    }
//}
