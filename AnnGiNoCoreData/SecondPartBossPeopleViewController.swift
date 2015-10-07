//
//  SecondPartBossPeoplesViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SecondPartBossPeopleViewController: UIViewController {
    
    var user: PersonalInformation!

    @IBOutlet weak var peopleTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        title = "初始問卷 (9/72)"
        var backbutton = UIBarButtonItem(title: "9/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        peopleTextField.becomeFirstResponder()
    }
    
    func tap() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertError() {
        var alert = UIAlertController(title: "輸入有誤", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        var ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "9 to 10" {
            let vc = segue.destinationViewController as! SecondPartWorkTogetherTimeViewController
            vc.user = user
        }
    }


    @IBAction func nextClicked() {
        if let people = Int(peopleTextField.text!) {
            user.peopleThatDirectManagerManaged = people
            performSegueWithIdentifier("9 to 10", sender: user)
        } else {
            peopleTextField.text = ""
            alertError()
        }
    }
}
