//
//  ThirdParConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/25.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class ThirdParConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // Do any additional setup after loading the view.
        title = "第三部份確認".localized
        var backbutton = UIBarButtonItem(title: "第三部份確認".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
		resultTextView.text = "面對面進行互動。".localized
		resultTextView.text = resultTextView.text + "\n\(user.intensityOfSupervisorSubordinateInteractionQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "使用電子郵件進行互動。".localized
		resultTextView.text = resultTextView.text + "\n\(user.intensityOfSupervisorSubordinateInteractionQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "在電話中進行互動。".localized
		resultTextView.text = resultTextView.text + "\n\(user.intensityOfSupervisorSubordinateInteractionQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "使用即時通訊軟體進行互動。".localized
		resultTextView.text = resultTextView.text + "\n\(user.intensityOfSupervisorSubordinateInteractionQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "使用內部簽核系統進行互動。".localized
		resultTextView.text = resultTextView.text + "\n\(user.intensityOfSupervisorSubordinateInteractionQuestion5)"
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
            let vc = segue.destinationViewController as! TraitJobSatisfaction1ViewController
            vc.user = user
        }
    }

}
