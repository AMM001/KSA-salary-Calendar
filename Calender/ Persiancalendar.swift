//
//  ViewController3.swift
//  Calender
//
//  Created by mac on 8/27/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import FSCalendar
import SnapKit


class  Persiancalendar: UIViewController  ,FSCalendarDelegate , FSCalendarDataSource {
    
    fileprivate let persian: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.persian)
    
    
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet
    weak var calendarHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var todaylb: UILabel!
    @IBOutlet weak var monthlb: UILabel!
    @IBOutlet weak var yearlb: UILabel!
    @IBOutlet weak var rest: UILabel!
    @IBOutlet weak var labelrest: UILabel!
    @IBOutlet weak var smallview: UIView!
    @IBOutlet weak var largeview: UIView!
    
    var res :Int = 0

    
    
    public let formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd"
        return formatter
    }()
    
    fileprivate let formatter1: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        return formatter
    }()
    fileprivate let formatter2: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM"
        return formatter
    }()
    
    
    override func viewDidLayoutSubviews() {
        // let x:CGFloat      = self.smallview.bounds.origin.x
        // using snapkit
        smallview.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(10)
            make.trailing.equalToSuperview()
          //  make.width.equalTo(290)
            switch(res){
            case 0  :
                make.width.equalTo(324)
            case 1 , 2 :
                make.width.equalTo(300)
            case 3 , 4  :
                make.width.equalTo(320)
            case 6 , 7 :
                make.width.equalTo(315)
            case 8 , 9 :
                make.width.equalTo(300)
            case 10 , 11 :
                make.width.equalTo(290)
            case 12 , 13 :
                make.width.equalTo(280)
            case 14 , 15 :
                make.width.equalTo(162)
            case 16 , 17 :
                make.width.equalTo(150)
            case 18 , 19 :
                make.width.equalTo(140)
            case 20 , 21 :
                make.width.equalTo(100)
            case 22 , 23 :
                make.width.equalTo(90)
            case 24 , 25 :
                make.width.equalTo(80)
            case 26 , 27 :
                make.width.equalTo(50)
            case 28 , 29 :
                make.width.equalTo(30)
            case 30 :
                make.width.equalTo(10)
            case 31 :
                make.width.equalTo(0)
            default :
                make.width.equalTo(324)
                
            }

            
            make.top.equalTo(0)
            // make.center.equalTo(self.view)
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIDevice.current.model.hasPrefix("iPad") {
            self.calendarHeightConstraint.constant = 400
        }
        
        self.calender.appearance.caseOptions = [.headerUsesUpperCase,.weekdayUsesUpperCase]
      //  self.calender.select(self.formatter.date(from: "2017/08/10")!)
        
        let scopeGesture = UIPanGestureRecognizer(target: self.calender, action: #selector(self.calender.handleScopeGesture(_:)))
        self.calender.addGestureRecognizer(scopeGesture)
        

        
        self.calender.locale = Locale(identifier: "AR")
        self.calender.identifier = NSCalendar.Identifier.persian.rawValue
        
        
        self.calender.delegate = self;
        self.calender.dataSource = self;
        // Do any additional setup after loading the view.
    }
    
    

    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        let calenderp =   Calendar(identifier:Calendar.Identifier.persian)
        
        let components = calenderp.dateComponents([.year, .month, .day, .hour], from: date)
        let finalDate = calenderp.date(from:components)
        formatter.calendar = calenderp
        formatter2.calendar = calenderp
        formatter1.calendar = calenderp
        monthlb.text = formatter2.string(from: Date())
        
        
        todaylb.text = formatter.string(from: Date())
        print("\(todaylb.text)")
        
        yearlb.text  = formatter1.string(from: Date())
        
        
        let today:Int? = Int(formatter.string(from: Date()))
        let month:Int? = Int(formatter2.string(from: Date()))


        
        if (month == 1 || month == 2 || month == 3 || month == 4 || month == 5 || month == 6  ){
            let x = 31
            res = x - today!
            
        }
        else if (month == 7 || month == 8 || month == 9 || month == 11 ){
            let x = 30
            res = x - today!
            
        }
        else if (month == 12){
            let x = 29
            res = x - today!
            
            
        }
        rest.text = String(res) + "ايام"
        

        
    
        if (month == 1) {
            
            monthlb.text = "حمل"
        }
        
        if (month == 2) {
            
            monthlb.text = "ثور"
        }
        
        if (month == 3) {
            
            monthlb.text = "جوزاء"
        }
        
        if (month == 4) {
            
            monthlb.text = "سرطان"
        }
        
        if (month == 5) {
            
            monthlb.text = "آسد"
        }
        
        if (month == 6) {
            
            monthlb.text = "سنبله"
        }
        
        if (month == 7) {
            
            monthlb.text = "ميزان"
        }
        
        if (month == 8) {
            
            monthlb.text = "عقرب"
        }
        
        if (month == 9) {
            
            monthlb.text = "قوس"
        }
        
        if (month == 10) {
            
            monthlb.text = "جدي"
        }
        
        if (month == 11) {
            
            monthlb.text = "دلو"
        }
        
        if (month == 12) {
            
            monthlb.text = "حوت"
        }
        
        


        print(finalDate!);
        return " \(components.day!)"
        
    }
    func calendar(_ calendar: FSCalendar, boundingRectWillChange bounds: CGRect, animated: Bool) {
        self.calendarHeightConstraint.constant = bounds.height
        self.view.layoutIfNeeded()
    }
    
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
     
        return nil
     }
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return self.formatter.date(from: "2017/12/30")!
//    }
    
    
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        
        return Date();
    }
    
    
}
