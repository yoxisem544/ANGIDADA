//
//  FifthPartConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/25.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class FifthPartConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // Do any additional setup after loading the view.
        title = "第五部份確認".localized
        var backbutton = UIBarButtonItem(title: "第五部份確認".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
		resultTextView.text = "我常必須在短時間內，完成所交付的工作任務。".localized
		resultTextView.text = resultTextView.text + "\n\(user.quantitativeJobDemandQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "我常必須非常努力，才有可能完成工作任務。".localized
		resultTextView.text = resultTextView.text + "\n\(user.quantitativeJobDemandQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我常必須格外費心，才能圓滿達成工作任務。".localized
		resultTextView.text = resultTextView.text + "\n\(user.quantitativeJobDemandQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我常必須超時工作，才能如期完成工作任務。".localized
		resultTextView.text = resultTextView.text + "\n\(user.quantitativeJobDemandQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "為完成工作任務，我常必須同時滿足不同對象的要求。".localized
		resultTextView.text = resultTextView.text + "\n\(user.quantitativeJobDemandQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "在工作中，我常必須面對很難搞的接觸對象。".localized
		resultTextView.text = resultTextView.text + "\n\(user.emotionalJobDemandQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "在工作中，我常必須設法說服他人接受我的提議。".localized
		resultTextView.text = resultTextView.text + "\n\(user.emotionalJobDemandQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我常必須在工作中控制或展現情緒，會相當吃力。".localized
		resultTextView.text = resultTextView.text + "\n\(user.emotionalJobDemandQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我常會在工作中遭遇使自己心情受影響的事。".localized
		resultTextView.text = resultTextView.text + "\n\(user.emotionalJobDemandQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "我常會在工作中經歷使自己難受、生氣的情況。".localized
		resultTextView.text = resultTextView.text + "\n\(user.emotionalJobDemandQuestion5)"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBAction func nextClicked() {
        performSegueWithIdentifier("next", sender: user)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! PowerDistanceOrientation1ViewController
            vc.user = user
        }
    }

}
