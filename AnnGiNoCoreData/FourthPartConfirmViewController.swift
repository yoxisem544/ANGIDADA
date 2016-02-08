//
//  FourthPartConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/25.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class FourthPartConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // Do any additional setup after loading the view.
        title = "第四部份確認".localized
        var backbutton = UIBarButtonItem(title: "第四部份確認".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
		resultTextView.text = "我能從工作中獲得真正的快樂。".localized
		resultTextView.text = resultTextView.text + "\n\(user.traitJobSatisfactionQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "大多數時候，我都對自己的工作充滿熱情。".localized
		resultTextView.text = resultTextView.text + "\n\(user.traitJobSatisfactionQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我對自己的工作成果相當滿意。".localized
		resultTextView.text = resultTextView.text + "\n\(user.traitJobSatisfactionQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我工作中的每一分鐘都像是度日如年。".localized
		resultTextView.text = resultTextView.text + "\n\(user.traitJobSatisfactionQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "工作令我感覺很不愉快。".localized
		resultTextView.text = resultTextView.text + "\n\(user.traitJobSatisfactionQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "我對自己的完成工作的能力深具信心。".localized
		resultTextView.text = resultTextView.text + "\n\(user.competenceQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "我確信自己具備完成工作所需的各種能力。".localized
		resultTextView.text = resultTextView.text + "\n\(user.competenceQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我已精通完成工作所需的相關技能。".localized
		resultTextView.text = resultTextView.text + "\n\(user.competenceQuestion3)"
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
            let vc = segue.destinationViewController as! QuantitativeJobDemand1ViewController
            vc.user = user
        }
    }

}
