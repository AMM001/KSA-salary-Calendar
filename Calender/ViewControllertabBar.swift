//
//  ViewController.swift
//  EVTopTabBar
//
//  Created by Eric Vennaro on 02/29/2016.
//  Copyright (c) 2016 Eric Vennaro. All rights reserved.
//

import UIKit
import EVTopTabBar

class ViewControllertabBar: UIViewController, EVTabBar {
    
    
    var pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    
    var topTabBar: EVPageViewTopTabBar? {
        didSet {
            topTabBar?.fontColors = (selectedColor: UIColorFromRGB(rgbValue: 0x56c7a4), unselectedColor: UIColor.lightGray)

            
            topTabBar?.rightButtonText = "تحويل "
            topTabBar?.leftButtonText = "ميلادي"
            topTabBar?.middleButtonText = "هجري "
            topTabBar?.middleRightButtonText = "شمسي"
            topTabBar?.labelFont = UIFont(name: "DINNextLTArabic-Regular", size: 25)
           // topTabBar?.indicatorViewColor = UIColor.init(displayP3Red: 86, green: 199, blue: 164, alpha: 1)
           // topTabBar?.indicatorViewColor = UIColor.brown
            
           // topTabBar?.indicatorViewColor  = UIColorFromRGB(rgbValue: 0x56c7a4)

            topTabBar?.backgroundColor = UIColor.white
            topTabBar?.delegate = self
        }
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    
    
    
    
    var subviewControllers: [UIViewController] = []
     var shadowView = UIImageView()
    
    // action button for about page
    
    func fbButtonPressed() {
        print("eeeee")

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AboutViewController")
        self.present(vc!, animated: true, completion: nil)
        
    }
    // action button for share page

    
    func fbButtonPressed1() {
        print("uuuu")
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //barbuttonleft item
        
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: "Image-5.png"), for: UIControlState.normal)
        //add function for button
        button.addTarget(self, action: #selector(ViewControllertabBar.fbButtonPressed), for: UIControlEvents.touchUpInside)
        //set frame
        button.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
    
    //barbuttonRight item 
        
        let button1 = UIButton.init(type: .custom)
        //set image for button
        button1.setImage(UIImage(named: "Image-4.png"), for: UIControlState.normal)
        //add function for button
        button1.addTarget(self, action: #selector(ViewControllertabBar.fbButtonPressed1), for: UIControlEvents.touchUpInside)
        //set frame
        button1.frame = CGRect(x: 0, y: 0, width: 53, height: 51)
        
        let barButton1 = UIBarButtonItem(customView: button1)
        //assign button to navigationbar
        self.navigationItem.rightBarButtonItem = barButton1
    
        
        
        
        

        topTabBar = EVPageViewTopTabBar(for: .four)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController = storyboard.instantiateViewController(withIdentifier: "Gregoriancalendar") as! Gregoriancalendar
        
        let storyboard2 = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController2 = storyboard2.instantiateViewController(withIdentifier: "Islamiccalendar") as! Islamiccalendar
        
        let storyboard3 = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController3 = storyboard3.instantiateViewController(withIdentifier: "Persiancalendar") as! Persiancalendar
        
        let storyboard4 = UIStoryboard(name: "Main", bundle: nil)
        let rootViewController4 = storyboard4.instantiateViewController(withIdentifier: "TransferViewController") as! TransferViewController
        
        
      //  let firstVC = FirstViewController(nibName:"FirstViewController", bundle: nil)
      //  let secondVC = SecondViewController(nibName:"SecondViewController", bundle: nil)
      //  let thirdVC = ThirdViewController(nibName: "ThirdViewController", bundle: nil)
       // let fourthVC = FourthViewController(nibName: "FourthViewController", bundle: nil)
        subviewControllers = [rootViewController,rootViewController2,rootViewController3,rootViewController4]
        setupPageView()
        setupConstraints()
        self.title = "هجري شمسي"
    }
    func setupConstraints() {
    let views: [String:AnyObject] = ["menuBar" : topTabBar!, "pageView" : pageController.view, "shadow" : shadowView]
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[menuBar]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[menuBar(==40)][pageView]|", options: [], metrics: nil, views: views))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[pageView]|", options: [], metrics: nil, views: views))
    
    pageController.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "|[shadow]|", options: [], metrics: nil, views: views))
    pageController.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[shadow(7)]", options: [], metrics: nil, views: ["shadow" : shadowView]))
    }

    
    
}

//MARK: EVTabBarDataSource
extension ViewControllertabBar: EVTabBarDelegate {
    func willSelectViewControllerAtIndex(_ index: Int, direction: UIPageViewControllerNavigationDirection) {
        if index > subviewControllers.count {
            pageController.setViewControllers([subviewControllers[subviewControllers.count - 1]], direction: direction, animated: true, completion: nil)
        } else {
            pageController.setViewControllers([subviewControllers[index]], direction: direction, animated: true, completion: nil)
        }
    }
    
}
