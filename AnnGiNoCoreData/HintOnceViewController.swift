//
//  HintOnceViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class HintOnceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "前言"
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.png")!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startClicked(sender: AnyObject) {
        performSegueWithIdentifier("ToFirstPart", sender: self)
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ToFirstPart" {
            
        }
    }


}
