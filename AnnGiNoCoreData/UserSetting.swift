//
//  UserSetting.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/7.
//  Copyright © 2015年 David. All rights reserved.
//

import Foundation

class UserSetting {
    struct Key {
        static let nextWorkingDay = "nextWorkingDay"
    }
    var nextWorkingDay: NSDate? {
        get {
            let ud = NSUserDefaults.standardUserDefaults()
            return ud.objectForKey(Key.nextWorkingDay) as? NSDate
        }
    }
    class func setNextWorkingDay(day: Int) {
        let nextWorkingDay = NSDate().dateByAddingTimeInterval(60*60*24*Double(day))
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setObject(nextWorkingDay, forKey: Key.nextWorkingDay)
    }
}