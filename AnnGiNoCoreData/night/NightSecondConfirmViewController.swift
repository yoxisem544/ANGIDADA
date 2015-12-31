//
//  NightSecondConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/11.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class NightSecondConfirmViewController: UIViewController {

    var questionare: Questionare!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-night.jpg")!)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked() {
        performSegueWithIdentifier("next", sender: questionare)
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! SupervisorDirectedOCB1ViewController
            vc.questionare = questionare
        }
    }

}
