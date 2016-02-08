//
//  ShowDetailNotiDateViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/7.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class ShowDetailNotiDateViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    let weekdayString = ["週日".localized,"週一".localized,"週二".localized,"週三".localized,"週四".localized,"週五".localized,"週六".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        setView()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        setView()
    }

    func setView() {
//        NSCalendar* cal = [NSCalendar currentCalendar];
//        NSDateComponents* comp = [cal components:kCFCalendarUnitWeekday fromDate:[NSDate date]];
//        return [comp weekday];
        
        // Do any additional setup after loading the view.
        let nextWorkingDay = UserSetting().nextWorkingDay
        let formatter = NSDateFormatter()
        //        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        formatter.dateFormat = "MM-dd"
        
        if nextWorkingDay != nil {
            let cal = NSCalendar.currentCalendar()
            let comp = cal.components(NSCalendarUnit.Weekday, fromDate: nextWorkingDay!)
            
            let s = formatter.stringFromDate(nextWorkingDay!)
            print(comp.weekday)
            contentLabel.text = "目前設定的下次上班日：".localized + s + "\((weekdayString[comp.weekday-1]))"
        } else {
            contentLabel.text = "目前設定的下次上班日：".localized + "尚未設定".localized
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
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
