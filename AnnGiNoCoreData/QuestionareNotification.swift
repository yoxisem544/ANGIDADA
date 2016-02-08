//
//  QUestionareNotification.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/6.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit
import Foundation

class QuestionareNotification {
    
    class func clearNotification() {
        UIApplication.sharedApplication().cancelAllLocalNotifications()
    }
    
    class func setNotificationAfterFewDays(days: Int) {
        let calendar = NSCalendar.currentCalendar()
        let component = NSDateComponents()
        let now = NSDate()
        component.year = now.year
        component.month = now.month
        component.day = now.day + days
        component.hour = 9
        component.minute = 0
        component.second = 0
        calendar.timeZone = NSTimeZone.defaultTimeZone()
        var dateToFire = calendar.dateFromComponents(component)
        
        let localNotification = UILocalNotification()
        localNotification.timeZone = NSTimeZone.defaultTimeZone()
        localNotification.fireDate = dateToFire
        localNotification.alertBody = "請填寫早上問卷！".localized
        localNotification.soundName = "default"
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        
        component.hour = 14
        print(component)
        dateToFire = calendar.dateFromComponents(component)
        let localNotification2 = UILocalNotification()
        localNotification2.timeZone = NSTimeZone.defaultTimeZone()
        localNotification2.fireDate = dateToFire
        localNotification2.alertBody = "請填寫中午問卷！".localized
        localNotification2.soundName = "default"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification2)
        
        component.hour = 18
        print(component)
        dateToFire = calendar.dateFromComponents(component)
        let localNotification3 = UILocalNotification()
        localNotification3.timeZone = NSTimeZone.defaultTimeZone()
        localNotification3.fireDate = dateToFire
        localNotification3.alertBody = "請填寫晚上問卷！".localized
        localNotification3.soundName = "default"
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification3)
        
        print(UIApplication.sharedApplication().scheduledLocalNotifications?.count)
    }
}

extension NSDate {
    var year: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "yyyy"
        let year = Int(formatter.stringFromDate(self))
        return year!
    }
    
    var month: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "MM"
        let month = Int(formatter.stringFromDate(self))
        return month!
    }
    
    var day: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "dd"
        let day = Int(formatter.stringFromDate(self))
        return day!
    }
    
    var hour: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH"
        let h = Int(formatter.stringFromDate(self))
        return h!
    }
    
    var minute: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "mm"
        let m = Int(formatter.stringFromDate(self))
        return m!
    }
    
    var second: Int {
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "ss"
        let s = Int(formatter.stringFromDate(self))
        return s!
    }
}