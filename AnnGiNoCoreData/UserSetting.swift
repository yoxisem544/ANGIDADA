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
        // user state
        static let userName = "userName"
        static let userUUID = "userUUID"
        static let userPhone = "userPhone"
        static let userEMAIL = "userEMAIL"
        static let userCompany = "userCompany"
        static let userDepartment = "userDepartment"
        // states
        static let isUserFinishedFirstSurvey = "isUserFinishedFirstSurvey"
        // informations
        static let nextWorkingDay = "nextWorkingDay"
        // store progress
        static let initialQuestionareCount = "initialQuestionareCount"
        static let everydayQuestionareCount = "everydayQuestionareCount"
        static let afterQuestionareCount = "afterQuestionareCount"
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
        ud.synchronize()
    }
    class func incrementInitialQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        var count = ud.integerForKey(Key.initialQuestionareCount)
        if count == 0 {
            count = 1
            ud.setInteger(count, forKey: Key.initialQuestionareCount)
            ud.synchronize()
        }
    }
    class func clearInitialQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setInteger(0, forKey: Key.initialQuestionareCount)
        ud.synchronize()
    }
    class func everydayQuestionareCount() -> Int {
        let ud = NSUserDefaults.standardUserDefaults()
        let count = ud.integerForKey(Key.everydayQuestionareCount)
        return count
    }
    class func incrementEverydayQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        let count = ud.integerForKey(Key.everydayQuestionareCount)
        ud.setInteger((count + 1), forKey: Key.everydayQuestionareCount)
        ud.synchronize()
    }
    class func decrementEverydayQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        let count = ud.integerForKey(Key.everydayQuestionareCount)
        ud.setInteger((count - 1), forKey: Key.everydayQuestionareCount)
        ud.synchronize()
    }
    class func incrementAfterQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        var count = ud.integerForKey(Key.afterQuestionareCount)
        if count == 0 {
            count = 1
            ud.setInteger(count, forKey: Key.afterQuestionareCount)
            ud.synchronize()
        }
    }
    class func clearAfterQuestionareCount() {
        let ud = NSUserDefaults.standardUserDefaults()
        ud.setInteger(0, forKey: Key.afterQuestionareCount)
        ud.synchronize()
    }
    
    // MARK: - user information
    class func storeUserInformation(user: PersonalInformation) {
        if user.userUUID != nil && user.userName != nil && user.userCompany != nil && user.userEMAIL != nil && user.userPhone != nil && user.userDepartment != nil {
            let ud = NSUserDefaults.standardUserDefaults()
            ud.setObject(user.userUUID, forKey: Key.userUUID)
            ud.setObject(user.userPhone, forKey: Key.userPhone)
            ud.setObject(user.userEMAIL, forKey: Key.userEMAIL)
            ud.setObject(user.userDepartment, forKey: Key.userDepartment)
            ud.setObject(user.userCompany, forKey: Key.userCompany)
            ud.setObject(user.userName, forKey: Key.userName)
            ud.synchronize()
        }
    }
    class func userName() -> String? {
        let ud = NSUserDefaults.standardUserDefaults()
        if let name = ud.objectForKey(Key.userName) as? String {
            return name
        }
        return nil
    }
    class func userUUID() -> String? {
        let ud = NSUserDefaults.standardUserDefaults()
        if let uuid = ud.objectForKey(Key.userUUID) as? String {
            return uuid
        }
        return nil
    }
}