//
//  MiddleOfSecondPartViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class MiddleOfSecondPartViewController: UIViewController {
    
    var user: PersonalInformation!

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        title = "說明"
        var backbutton = UIBarButtonItem(title: "說明", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked() {
        performSegueWithIdentifier("continue second part", sender: user)
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "continue second part" {
            let vc = segue.destinationViewController as! Authoritarian1ViewController
            vc.user = user
        }
    }


}
