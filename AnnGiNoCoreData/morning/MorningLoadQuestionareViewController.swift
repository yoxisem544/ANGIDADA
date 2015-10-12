//
//  MorningLoadQuestionareViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/12.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class MorningLoadQuestionareViewController: UIViewController {

    var questionare: Questionare!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        questionare.retrieveUnfinishedQuestionare { (questionare) -> Void in
            if let q = questionare {
                self.questionare = q
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked() {
        if questionare != nil {
            performSegueWithIdentifier("next", sender: questionare)
        }
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! ExpectedQuantativeJobDemand1ViewController
            vc.questionare = questionare
        }
    }

}
