//
//  MorningLastConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/12.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class MorningLastConfirmViewController: UIViewController {

    var questionare: Questionare!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func finishedQuestionareClicked() {
        questionare.saveToParse({ () -> Void in
            // ok
            print("save to parse! \(self.questionare.objectId)")
            self.dismissViewControllerAnimated(true, completion: nil)
            }, failure: { () -> Void in
                // fail
                print("fail to save to parse! \(self.questionare.objectId)")
        })
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