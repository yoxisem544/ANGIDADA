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
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveToParse() {
        questionare.nightStamp = true
        questionare.saveToParse({ () -> Void in
            print("ok to parse night")
//            self.dismissViewControllerAnimated(true, completion: nil)
            self.questionare.completeQuestionare()
            self.performSegueWithIdentifier("next", sender: nil)
            }) { () -> Void in
                print("fail to save to parse night")
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
