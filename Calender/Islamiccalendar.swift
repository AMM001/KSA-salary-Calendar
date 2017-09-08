//
//  ViewController2.swift
//  Calender
//
//  Created by mac on 8/27/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
import FSCalendar
import SnapKit

class Islamiccalendar: UIViewController ,FSCalendarDataSource , FSCalendarDelegate{

    fileprivate let islamic: NSCalendar! = NSCalendar(calendarIdentifier:NSCalendar.Identifier.islamicUmmAlQura)
    
    
    @IBOutlet weak var calender: FSCalendar!
    @IBOutlet weak var todaylb: UILabel!
    @IBOutlet weak var monthlb: UILabel!
    @IBOutlet weak var yearlb: UILabel!
    @IBOutlet weak var rest: UILabel!
    @IBOutlet weak var labelrest: UILabel!
    @IBOutlet weak var smallview: UIView!
    @IBOutlet weak var largeview: UIView!
    
    var res :Int = 0

    
    
    fileprivate let formatter: DateFormatter = {
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
           // make.width.equalTo(290)
            switch(res){
            case 0  :
                make.width.equalTo(324)
            case 1 , 2 :
                make.width.equalTo(320)
            case 3 , 4  :
                make.width.equalTo(300)
            case 6 , 7 :
                make.width.equalTo(290)
            case 8 , 9 :
                make.width.equalTo(270)
            case 10 , 11 :
                make.width.equalTo(250)
            case 12 , 13 :
                make.width.equalTo(200)
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
        
       // todaylb.text = formatter.string(from: Date())
        yearlb.text  = formatter1.string(from: Date())
        monthlb.text = formatter2.string(from: Date())
        
        let today:Int? = Int(formatter.string(from: Date()))
        let _:Int? = Int(formatter1.string(from: Date()))
        let month:Int? = Int(formatter2.string(from: Date()))
        
        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12 ){
            let x = 31
            res = x - today!
            print (rest)
        }
        else if (month == 4 || month == 6 || month == 6 || month == 9 || month == 11 ){
            let x = 30
            res = x - today!
            
        }
        else if (month == 2){
            let x = 28
            res = x - today!
            
            
        }
        rest.text = String(res)
        
//        func date(withYear year: Int, month: Int, day: Int) -> Date{
//        
//        
//        }

        
        self.calender.locale = Locale(identifier: "AR")
        self.calender.identifier = NSCalendar.Identifier.islamicUmmAlQura.rawValue
        

        // Do any additional setup after loading the view.
    }
    
    // MARK:- FSCalendarDataSource
    
    func calendar(_ calendar: FSCalendar, titleFor date: Date) -> String? {
        let calenderp =   Calendar(identifier:Calendar.Identifier.islamicUmmAlQura)
        
        let components = calenderp.dateComponents([ .day], from: date)
        let finalDate = calenderp.date(from:components)
        print(finalDate!);
        formatter.calendar = calenderp
        formatter2.calendar = calenderp
        formatter1.calendar = calenderp
        
        monthlb.text = formatter2.string(from: Date())
        todaylb.text = formatter.string(from: Date())
        yearlb.text  = formatter1.string(from: Date())
        
        
        let today:Int? = Int(formatter.string(from: Date()))
        let month:Int? = Int(formatter2.string(from: Date()))

        if (month == 1 || month == 3 || month == 5 || month == 7 || month == 9 || month == 11){
            let x = 30
            res = x - today!
            print (rest)
        }
        else if (month == 2 || month == 4 || month == 6 || month == 8 || month == 10 || month == 12 ){
            let x = 29
            res = x - today!
            
        }
       

        rest.text = String(res)
        

        
        
        
        if (month == 1) {
            
            monthlb.text = "محرم"
        }
        
        if (month == 2) {
            
            monthlb.text = "صفر"
        }
        
        if (month == 3) {
            
            monthlb.text = "ربيع الاول"
        }
        
        if (month == 4) {
            
            monthlb.text = "ربيع الاخر"
        }
        
        if (month == 5) {
            
            monthlb.text = "جمادالاول"
        }
        
        if (month == 6) {
            
            monthlb.text = "جمادالاخر"
        }
        
        if (month == 7) {
            
            monthlb.text = "رجب"
        }
        
        if (month == 8) {
            
            monthlb.text = "شعبان"
        }
        
        if (month == 9) {
            
            monthlb.text = "رمضان"
        }
        
        if (month == 10) {
            
            monthlb.text = "شوال"
        }
        
        if (month == 11) {
            
            monthlb.text = "ذوالقعده"
        }
        
        if (month == 12) {
            
            monthlb.text = "ذوالحجه"
        }
        


        return " \(components.day!)"

    }
    
    func calendar(_ calendar: FSCalendar, subtitleFor date: Date) -> String? {
        
        return nil
        
                //        guard self.lunar else {
        //            return nil
        //        }
        //        return self.lunarFormatter.string(from: date)
    }
//    func maximumDate(for calendar: FSCalendar) -> Date {
//        return self.formatter.date(from: "2017/12/30")!
//    }
    
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        
        return Date();
    }

    


   
}
