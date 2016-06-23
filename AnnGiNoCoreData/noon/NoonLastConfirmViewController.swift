//
//  NoonLastConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/12.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class NoonLastConfirmViewController: UIViewController {
    
    var questionare: Questionare!

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-noon.jpg")!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmAndSaveToParse() {
        questionare.noonStamp = true
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        questionare.noonTime = formatter.stringFromDate(NSDate())
        questionare.saveToParse({ () -> Void in
            print("save to parse ok noon")
            self.showAlert()
            }) { () -> Void in
                print("fail to save noon")
				self.showFailAlert()
        }
    }
	
	
	func showAlert() {
		let alert = UIAlertController(title: "成功", message: "已確認成功上傳下午問卷到資料庫，請記得下次填答時間", preferredStyle: .Alert)
		let ok = UIAlertAction(title: "好", style: .Default) { (_) in
			dispatch_async(dispatch_get_main_queue()) {
				self.dismissViewControllerAnimated(true, completion: nil)
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
