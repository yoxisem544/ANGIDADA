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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print(checkWhichSurveyToDo())
        
        let test = Questionare()
//        test.saveToParse()
        print(test.retrieveUnfinishedQuestionareId())
        var testToRetrieve: Questionare!
        test.retrieveUnfinishedQuestionare { (questionare) -> Void in
            testToRetrieve = questionare
            print(testToRetrieve.objectId)
        }
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
        if let nextWorkingDay = UserSetting().nextWorkingDay {
            formatter.dateFormat = "MM"
            // check month first
            let thisMonth = Int(formatter.stringFromDate(now))
            let nextMonth = Int(formatter.stringFromDate(nextWorkingDay))
            if thisMonth <= nextMonth {
                formatter.dateFormat = "dd"
                let thisDate = Int(formatter.stringFromDate(now))
                let nextDate = Int(formatter.stringFromDate(nextWorkingDay))
                if thisDate == nextDate {
                    return surveyNumber
                }
            }
            // return the result
        }
        
        return 0
    }
    
    func pushSegueAndDoQuestionare(surveyNumber: Int) {
        if surveyNumber == 0 {
            
        } else if surveyNumber == 1 {
            performSegueWithIdentifier("morning", sender: nil)
        } else if surveyNumber == 2 {
            performSegueWithIdentifier("noon", sender: nil)
        } else if surveyNumber == 3 {
            performSegueWithIdentifier("night", sender: nil)
        }
    }

    @IBAction func startButtonClicked(sender: AnyObject) {
        // check date now
        let formatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH:mm"
        
        print(formatter.stringFromDate(NSDate()))
        
        QuestionareNotification.clearNotification()
        QuestionareNotification.setNotificationAfterFewDays(2)
        
        pushSegueAndDoQuestionare(1)
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
