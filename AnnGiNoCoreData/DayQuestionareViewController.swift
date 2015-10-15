//
//  DayQuestionareViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/5.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit
import Parse

class DayQuestionareViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var canDoSurveyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
        print(checkWhichSurveyToDo())
        print("ok to do the survey? \(checkIfTodayIsTheDateToDoSurvey())")
        
        let test = Questionare()
//        test.saveToParse()
        print(test.retrieveUnfinishedQuestionareId())
        print(UserSetting.everydayQuestionareCount())
    }
    func checkIfUserIstryingToDoSurveyAgain() -> Bool {
        if let lastCompletedSurveyDate = UserSetting.lastCompletedSurveyDate() {
            let now = NSDate()
            let formatter = NSDateFormatter()
            formatter.dateFormat = "MM"
            let monthNow = Int(formatter.stringFromDate(now))
            let monthLastCompleted = Int(formatter.stringFromDate(lastCompletedSurveyDate))
            
            formatter.dateFormat = "dd"
            let dayNow = Int(formatter.stringFromDate(now))
            let dayLastCompleted = Int(formatter.stringFromDate(lastCompletedSurveyDate))
            
            if monthNow == monthLastCompleted {
                if dayNow == dayLastCompleted {
                    return true
                }
            }
            
        }
        return false
    }
    
    func checkIfThereIsAUnfinishedSurvey() -> Bool {
        if Questionare().retrieveUnfinishedQuestionareId() != nil {
            return true
        }
        return false
    }
    
    
    func checkIfTodayIsTheDateToDoSurvey() -> Bool {
        
        if let nextWorkingDay = UserSetting().nextWorkingDay {
            let now = NSDate()
            let formatter = NSDateFormatter()
            formatter.dateFormat = "MM"
            let monthNow = Int(formatter.stringFromDate(now))
            let monthToDoSurvey = Int(formatter.stringFromDate(nextWorkingDay))
            
            formatter.dateFormat = "dd"
            let dayNow = Int(formatter.stringFromDate(now))
            let dayToDoSurvey = Int(formatter.stringFromDate(nextWorkingDay))
            
            if monthNow == monthToDoSurvey {
                if dayNow == dayToDoSurvey {
                    return true
                }
            }
        }
        
        return false
    }
    
    func checkWhichSurveyToDo() -> Int {
        let now = NSDate()
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH"
        let h = Int(formatter.stringFromDate(now))
        formatter.dateFormat = "mm"
        let m = Int(formatter.stringFromDate(now))
        
        // check time
        
        // 0 is not avaliable
        var surveyNumber = 0
        
        // 1 for morning
        if h! * 60 + m! >= 9 * 60 + 0 {
            if h! * 60 + m! <= 12 * 60 + 30 {
                surveyNumber = 1
            }
        }
        // 2 for noon
        if h! * 60 + m! >= 14 * 60 + 0 {
            if h! * 60 + m! <= 17 * 60 + 30 {
                surveyNumber = 2
            }
        }
        // 3 for night
        if h! * 60 + m! >= 18 * 60 + 0 {
            if h! * 60 + m! <= 21 * 60 + 30 {
                surveyNumber = 3
            }
        }
        
        // check next survey date
//        if let nextWorkingDay = UserSetting().nextWorkingDay {
//            formatter.dateFormat = "MM"
//            // check month first
//            let thisMonth = Int(formatter.stringFromDate(now))
//            let nextMonth = Int(formatter.stringFromDate(nextWorkingDay))
//            if thisMonth <= nextMonth {
//                formatter.dateFormat = "dd"
//                let thisDate = Int(formatter.stringFromDate(now))
//                let nextDate = Int(formatter.stringFromDate(nextWorkingDay))
//                if thisDate == nextDate {
//                    return surveyNumber
//                }
//            }
//            // return the result
//        }
        
        return surveyNumber
    }
    
    func isNowMorning() -> Bool {
        let now = NSDate()
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH"
        let h = Int(formatter.stringFromDate(now))
        formatter.dateFormat = "mm"
        let m = Int(formatter.stringFromDate(now))
        
        // check time
        
        // 1 for morning
        if h! * 60 + m! >= 9 * 60 + 0 {
            if h! * 60 + m! <= 12 * 60 + 30 {
                return true
            }
        }
        return false
    }
    
    func pushSegueAndDoQuestionare(surveyNumber: Int) {
        if surveyNumber == 0 {
            alertNoQuestionare()
        } else if surveyNumber == 1 {
            performSegueWithIdentifier("morning", sender: nil)
        } else if surveyNumber == 2 {
            performSegueWithIdentifier("noon", sender: nil)
        } else if surveyNumber == 3 {
            performSegueWithIdentifier("night", sender: nil)
        }
    }
    
    func alertError(m: String, completion: () -> Void) {
        let message = m
        
        let alert = UIAlertController(title: "錯誤", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "好", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in
            completion()
        })
        alert.addAction(ok)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }

    func alertNoQuestionare() {
        var message = ""
        
        // check if lost a questionare
        message = "你今天有問卷沒有做到，請重新設定下次上班日！"
        // check if date is set

        // check if today
        if let date = UserSetting().nextWorkingDay {
            message = "上班日為\(date)"
        }
        // check if need to set date
        message = "非填答時段"
        
        let alert = UIAlertController(title: "錯誤", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "好", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    @IBAction func startButtonClicked(sender: AnyObject) {
        // check date now
        let formatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH:mm"
        
//        print(formatter.stringFromDate(NSDate()))
        
//        QuestionareNotification.clearNotification()
//        QuestionareNotification.setNotificationAfterFewDays(2)
        
        print(checkWhichSurveyToDo())
//        pushSegueAndDoQuestionare(1)

        if checkIfThereIsAUnfinishedSurvey() {
            if isNowMorning() {
                if checkIfThereIsAUnfinishedSurvey() {
                    print("alreay have do morning survey")
                    alertError("你已經做過了！不用重複填寫喔！", completion: {})
                } else {
                    pushSegueAndDoQuestionare(checkWhichSurveyToDo())
                }
            } else {
                if checkIfThereIsAUnfinishedSurvey() {
                    pushSegueAndDoQuestionare(checkWhichSurveyToDo())
                } else {
                    print("alreay have do morning survey")
                    alertError("你早上或者下午有漏掉問卷喔！今天的已經作廢了！", completion: {})
                }
            }
//            if checkIfUserIstryingToDoSurveyAgain() {
//                pushSegueAndDoQuestionare(checkWhichSurveyToDo())
//            } else {
//                if !checkIfThereIsAUnfinishedSurvey() {
//                    pushSegueAndDoQuestionare(checkWhichSurveyToDo())
//                } else {
//                    print("alreay have do morning survey")
//                    alertError("你已經做過了！不用重複填寫喔！", completion: {})
//                }
//            }
        } else {
            // if morning
            if !checkIfUserIstryingToDoSurveyAgain() {
                pushSegueAndDoQuestionare(checkWhichSurveyToDo())
            }
        }
    }
    
    @IBAction func morning() {
        pushSegueAndDoQuestionare(1)
    }
    @IBAction func noon() {
        pushSegueAndDoQuestionare(2)
    }
    @IBAction func night() {
        pushSegueAndDoQuestionare(3)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func printFonts() {
        let fontFamilyNames = UIFont.familyNames()
        for familyName in fontFamilyNames {
            print("------------------------------")
            print("Font Family Name = [\(familyName)]")
            let names = UIFont.fontNamesForFamilyName(familyName)
            print("Font Names = [\(names)]")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NSDate {
    var timeOfLocalTimeZone: NSDate {
        return NSDate()
    }
}
