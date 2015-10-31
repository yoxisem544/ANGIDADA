//
//  ProgressViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/3.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class ProgressViewController: UIViewController {

    @IBOutlet weak var firstQuestionareProgressLabel: UILabel!
    @IBOutlet weak var everydayProgressLabel: UILabel!
    @IBOutlet weak var finalQuestionareLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        updateUI()
    }
    
    func updateUI() {
        if UserSetting.hasUserFinishedFirstQuestionare() {
            firstQuestionareProgressLabel.text = "初始問卷： 1/1"
        } else {
            firstQuestionareProgressLabel.text = "初始問卷： 0/1"
        }
        
        everydayProgressLabel.text = "每日經驗取樣： \(UserSetting.everydayQuestionareCount())/10"
        finalQuestionareLabel.text = "事後調查： \(UserSetting.finalQuesionareCount())/1"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
