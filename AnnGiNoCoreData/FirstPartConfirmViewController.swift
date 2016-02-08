//
//  FirstPartConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class FirstPartConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
        title = "第一部份總結".localized
        
        var contentText = "您的性別是：\(user.sex)\n\n年齡：\(user.age)歲\n\n學歷：\(user.educationalBackground)\n\n總服務年資：\(user.serviceTimeLength)\n\n在公司中的職級：\(user.currentRank)\n\n所屬單位的性質：\(user.currentDepartmentProperty)\n\n所屬公司的產業性質：\(user.currentCompanyProperty)"
        resultLabel.text = contentText
    }

    @IBOutlet weak var resultLabel: UILabel!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func confirmAndGoToSecondPart(sender: AnyObject) {
        performSegueWithIdentifier("to second part", sender: user)
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "to second part" {
            let vc = segue.destinationViewController as! SecondPartStartViewController
            vc.user = user
        }
    }
    

}
