//
//  MorningStartViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/26.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class MorningStartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-morning.jpg")!)
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func dismissClicked() {
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
