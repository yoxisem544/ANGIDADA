//
//  AwardConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/15.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class AwardConfirmViewController: UIViewController {
    
    var award: Award!
    @IBOutlet weak var resultTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "資料確認"
        var backbutton = UIBarButtonItem(title: "資料確認", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        
        // Do any additional setup after loading the view.
        resultTextView.text = "你的名字：\(award.name)\n\n你的公司：\(award.company)\n\n你的部門：\(award.department)\n\n你的電子信箱：\(award.email)\n\n你的郵遞區號：\(award.zipCode)\n\n你的地址：\(award.address)\n\n你的行動電話：\(award.phoneNumber)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitClicked() {
        award.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                self.showSuccessful({ () -> Void in
                    UserSetting.userSuccessfullyGetTheAward()
                    UserSetting.incrementAfterQuestionareCount()
                    self.dismissViewControllerAnimated(true, completion: nil)
                })
            } else {
                self.alertError("可能沒有網路連線歐！請確定手機有連線上網！", completion: {})
            }
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
    
    func showSuccessful(completion: () -> Void) {
        let message = "本研究至此全部結束，感謝您配合填答！我們將盡快將籌謝禮券送達您的手中。"
        
        let alert = UIAlertController(title: "恭喜您", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "好", style: UIAlertActionStyle.Cancel, handler: {(action) -> Void in
            completion()
        })
        alert.addAction(ok)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.presentViewController(alert, animated: true, completion: nil)
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
