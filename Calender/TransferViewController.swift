//
//  TransferViewController.swift
//  Calender
//
//  Created by mac on 8/30/17.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
//import FSCalendar
//import SnapKit

class TransferViewController: UIViewController {
    
    var dayparsn :String!
    var monthparsn :String?
    var yearparsn  :String?
    var imageparsn :UIImage?
    
    var dayislamc  :String?
    var monthislamc :String?
    var yearislamc  :String?
    
    var daygregn :String?
    var monthgregn :String?
    var yeargregn :String?
    
    var reminder :String?
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var dayofparsn: UILabel!
    @IBOutlet weak var monthofparsn: UILabel!
    @IBOutlet weak var yearofparsn: UILabel!
    
    @IBOutlet weak var imageofparsn: UIImageView!
    @IBOutlet weak var dayofislamc: UILabel!
    @IBOutlet weak var monthofislamc: UILabel!
    @IBOutlet weak var yearofislamc: UILabel!
    @IBOutlet weak var dayofgregn: UILabel!
    @IBOutlet weak var monthofgregn: UILabel!
    @IBOutlet weak var yearofgregn: UILabel!
    
    @IBOutlet weak var reminderlb: UILabel!
    @IBOutlet weak var largeview: UIView!
    @IBOutlet weak var smallview: UIView!
    
     var res = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let calendarp = Calendar(identifier:Calendar.Identifier.persian)
        
        yearparsn  = String(calendarp.component(.year, from: date) )
        monthparsn   = String(calendarp.component(.month, from: date))
        dayparsn = String(calendarp.component(.day, from: date))
        let month :Int? = (Int)(calendarp.component(.month, from: date))
        
        let today:Int? = Int(calendarp.component(.day, from: date))
        
        
        
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
        reminder = String(res) 
        
        if (month == 1) {
            
             monthparsn = "حمل"
             imageparsn = UIImage(named: "virgo")!
        }
        
        if (month == 2) {
          monthparsn  = "ثور"
          imageparsn = UIImage(named: "aries")!
  
        }
        
        if (month == 3) {
            
            monthparsn  = "جوزاء"
            imageparsn = UIImage(named: "gemini")!

        }
        
        if (month == 4) {
            
           monthparsn = "سرطان"
           imageparsn = UIImage(named: "cancer")!
 
        }
        
        if (month == 5) {
             monthparsn = "آسد"
             imageparsn = UIImage(named: "leo")!

        }
        
        if (month == 6) {
          monthparsn  = "سنبله"
          imageparsn = UIImage(named: "virgo")!
            
  
        }
        
        if (month == 7) {
            
           monthparsn = "ميزان"
           imageparsn = UIImage(named: "libra")!
 
        }
        
        if (month == 8) {
            
           monthparsn = "عقرب"
           imageparsn = UIImage(named: "scorpius")!

        }
        
        if (month == 9) {
            
            monthparsn = "قوس"
            imageparsn = UIImage(named: "sagittarius")!

        }
        
        if (month == 10) {
            
           monthparsn = "جدي"
           imageparsn = UIImage(named: "capricornuis")!
 
        }
        
        if (month == 11) {
            
          monthparsn = "دلو"
          imageparsn = UIImage(named: "aquarius")!
  
        }
        
        if (month == 12) {
            
             monthparsn = "حوت"
             imageparsn = UIImage(named: "pisces")!

        }
        
        
        
     dayofparsn.text =  dayparsn
     monthofparsn.text = monthparsn
     yearofparsn.text = yearparsn
    self.imageofparsn.image = imageparsn
        
        let calendari = Calendar(identifier:Calendar.Identifier.islamicUmmAlQura)
        
        yearislamc  = String(calendari.component(.year, from: date) )
        monthislamc   = String(calendari.component(.month, from: date))
        dayislamc = String(calendari.component(.day, from: date))
        let monthi :Int? = (Int)(calendari.component(.month, from: date))
        
        if (monthi == 1) {
            
            monthislamc = "محرم"
        }
        
        if (monthi == 2) {
            
            monthislamc = "صفر"
        }
        
        if (monthi == 3) {
            
            monthislamc = "ربيع الاول"
        }
        
        if (monthi == 4) {
            
            monthislamc = "ربيع الاخر"
        }
        
        if (monthi == 5) {
            
            monthislamc = "جمادالاول"
        }
        
        if (monthi == 6) {
            
            monthislamc = "جمادالاخر"
        }
        
        if (monthi == 7) {
            
            monthislamc = "رجب"
        }
        
        if (monthi == 8) {
            
            monthislamc = "شعبان"
        }
        
        if (monthi == 9) {
            
            monthislamc = "رمضان"
        }
        
        if (monthi == 10) {
            
            monthislamc = "شوال"
        }
        
        if (monthi == 11) {
            
            monthislamc = "ذوالقعده"
        }
        
        if (monthi == 12) {
            
            monthislamc = "ذوالحجه"
        }



        
     dayofislamc.text = dayislamc
     monthofislamc.text = monthislamc
     yearofislamc.text  = yearislamc
        
        let calendarg = Calendar(identifier:Calendar.Identifier.gregorian)
        
        yeargregn  = String(calendarg.component(.year, from: date) )
        monthgregn   = String(calendarg.component(.month, from: date))
        daygregn = String(calendarg.component(.day, from: date))
        let monthg :Int? = (Int)(calendarg.component(.month, from: date))
        
        if (monthg == 1) {
            
            monthgregn = "يناير"
        }
        
        if (monthg == 2) {
            
            monthgregn = "فبراير"
        }
        
        if (monthg == 3) {
            
             monthgregn = "مارس"
        }
        
        if (monthg == 4) {
            
             monthgregn = "ابريل"
        }
        
        if (monthg == 5) {
            
            monthgregn = "مايو"
        }
        
        if (monthg == 6) {
            
             monthgregn = "يونيو"
        }
        
        if (monthg == 7) {
            
            monthgregn = "يوليو"
        }
        
        if (monthg == 8) {
            
            monthgregn = "اغسطس"
        }
        
        if (monthg == 9) {
            
             monthgregn = "سبتمبر"
        }
        
        if (monthg == 10) {
            
            monthgregn = "اكتوبر"
        }
        
        if (monthg == 11) {
            
             monthgregn = "نوفمبر"
        }
        
        if (monthg == 12) {
            
            monthgregn = "ديسمبر"
        }

        
       dayofgregn.text  = daygregn
       monthofgregn.text = monthgregn
       yearofgregn.text  = yeargregn
        
      reminderlb.text = reminder

    }
    
    override func viewDidLayoutSubviews() {
        // let x:CGFloat      = self.smallview.bounds.origin.x
        // using snapkit
        smallview.snp.makeConstraints { (make) -> Void in
            make.height.equalTo(10)
            make.trailing.equalToSuperview()
            // make.width.equalTo(290)
            switch(res){
            case 0  :
                make.width.equalTo(320)
            case 1 , 2 :
                make.width.equalTo(315)
            case 3 , 4  :
                make.width.equalTo(300)
            case 6 , 7 :
                make.width.equalTo(290)
            case 8 , 9 :
                make.width.equalTo(260)
            case 10 , 11 :
                make.width.equalTo(230)
            case 12 , 13 :
                make.width.equalTo(200)
            case 14 , 15 :
                make.width.equalTo(160)
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
                make.width.equalTo(70)
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

}
