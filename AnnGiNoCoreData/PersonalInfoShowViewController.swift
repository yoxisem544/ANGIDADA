//
//  PersonalInfoShowViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/17.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class PersonalInfoShowViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // Do any additional setup after loading the view.
        if let name = UserSetting.userName() {
            nameLabel.text = "姓名：\(name)"
        } else {
            nameLabel.text = "姓名："
        }
        emailLabel.text = "信箱：\(UserSetting.userEMAIL())"
        phoneLabel.text = "電話：\(UserSetting.userPhone())"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked() {
        dismissViewControllerAnimated(true, completion: nil)
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
