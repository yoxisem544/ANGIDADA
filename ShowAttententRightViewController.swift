//
//  ShowAttententRightViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/11/18.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class ShowAttententRightViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonClicked() {
        dismissViewControllerAnimated(true, completion: nil)    
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
