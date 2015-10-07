//
//  DayQuestionareViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/5.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class DayQuestionareViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        printFonts()
    }

    @IBAction func startButtonClicked(sender: AnyObject) {
        // check date now
        let formatter = NSDateFormatter()
//        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "HH:mm"
        
        print(formatter.stringFromDate(NSDate()))
        
        QuestionareNotification.clearNotification()
        QuestionareNotification.setNotificationAfterFewDays(2)
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
