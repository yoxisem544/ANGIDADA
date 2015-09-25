//
//  SecondPartStartViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SecondPartStartViewController: UIViewController {
    var user: PersonalInformation!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked() {
        performSegueWithIdentifier("second part start", sender: user)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "second part start" {
            let vc = segue.destinationViewController as! SecondPartBossSexPickerViewController
            vc.user = user
        }
    }


}