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
    let weekdayString = ["週日","週一","週二","週三","週四","週五","週六"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
            contentLabel.text = "目前設定的下次上班日：" + s + "\((weekdayString[comp.weekday-1]))"
        } else {
            contentLabel.text = "目前設定的下次上班日：" + "尚未設定"
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
