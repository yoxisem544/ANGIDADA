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
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        title = "第五部份確認"
        var backbutton = UIBarButtonItem(title: "第五部份確認", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
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
