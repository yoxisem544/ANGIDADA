//
//  NightStartViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/12.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class NightStartViewController: UIViewController {

    var questionare: Questionare!
    var isRetrieving: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-night.jpg")!)
        
        // Do any additional setup after loading the view.
        questionare = Questionare()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func startQuestionare() {
        if !isRetrieving {
            isRetrieving = true
            questionare.retrieveUnfinishedQuestionare({ (questionare) -> Void in
                if self.questionare.retrieveUnfinishedQuestionareId() == nil {
                    //                    self.alertError("你今早有問卷沒有做到，請重新設定下次上班日！")
                    self.alertError("你今早有問卷沒有做到，請重新設定下次上班日！".localized, completion: { () -> Void in
                        self.dismissViewControllerAnimated(true, completion: nil)
                        self.isRetrieving = false
                    })
                } else {
                    if let q = questionare {
                        self.questionare = q
                        if self.checkIfUserMissSomeOfTheQuestionare(q) {
                            self.alertError("你今早有問卷沒有做到，請重新設定下次上班日！".localized, completion: { () -> Void in
                                self.isRetrieving = false
                                self.dismissViewControllerAnimated(true, completion: nil)
                            })
                        } else {
                            self.performSegueWithIdentifier("next", sender: self.questionare)
                            self.isRetrieving = false
                        }
                    } else {
                        self.isRetrieving = false
                        //                        self.alertError("你的網路有問題喔！")
                        self.alertError("你的網路有問題喔！".localized, completion: { () -> Void in
                            
                        })
                        print("fail to retrieve")
                    }
                }
            })
        }
    }
    
    func checkIfUserMissSomeOfTheQuestionare(questionare: Questionare) -> Bool {
        
        // noon check
        if !questionare.noonStamp {
            // miss something
            return true
        }
        
        return false
    }
    
    func alertError(m: String, completion: () -> Void) {
        var message = ""
        
        // check if lost a questionare
        message = "你今早有問卷沒有做到，請重新設定下次上班日！".localized
        //        // check if date is set
        //
        //        // check if today
        //        if let date = UserSetting().nextWorkingDay {
        //            message = "上班日為\(date)"
        //        }
        //        // check if need to set date
        //        message = "請重新設定下次上班日！"
        message = m
        let alert = UIAlertController(title: "錯誤".localized, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "好".localized, style: UIAlertActionStyle.Cancel, handler: { (action) -> Void in
            completion()
        })
        alert.addAction(ok)
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! PositiveAffect1ViewController
            vc.questionare = questionare
        }
    }
}
