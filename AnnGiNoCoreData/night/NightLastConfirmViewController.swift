//
//  NightLastConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/12.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class NightLastConfirmViewController: UIViewController {
    
    var questionare: Questionare!

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-night.jpg")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveToParse() {
        questionare.nightStamp = true
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        questionare.nightTime = formatter.stringFromDate(NSDate())
        questionare.saveToParse({ () -> Void in
            print("ok to parse night")
//            self.dismissViewControllerAnimated(true, completion: nil)
            self.questionare.completeQuestionare()
			self.showAlert()
            }) { () -> Void in
                print("fail to save to parse night")
				self.showFailAlert()
        }
    }
	
	func showAlert() {
		let alert = UIAlertController(title: "成功", message: "已確認成功上傳晚間問卷到資料庫，請記得下次填答時間", preferredStyle: .Alert)
		let ok = UIAlertAction(title: "好", style: .Default) { (_) in
			dispatch_async(dispatch_get_main_queue()) {
				self.performSegueWithIdentifier("next", sender: nil)
			}
		}
		alert.addAction(ok)
		dispatch_async(dispatch_get_main_queue()) {
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	func showFailAlert() {
		let alert = UIAlertController(title: "上傳失敗", message: "請重新確認上傳", preferredStyle: .Alert)
		let ok = UIAlertAction(title: "好", style: .Default) { (_) in
			
		}
		alert.addAction(ok)
		dispatch_async(dispatch_get_main_queue()) {
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
    
//    func presentMainScreen() {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        let vc = storyboard.instantiateViewControllerWithIdentifier("main screen") as! UITabBarController
//        self.presentViewController(vc, animated: true, completion: nil)
//    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }


}
