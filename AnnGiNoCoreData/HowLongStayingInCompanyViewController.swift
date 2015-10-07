//
//  HowLongStayingInCompanyViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class HowLongStayingInCompanyViewController: UIViewController {

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        yearTextField.delegate = self
        monthTextField.delegate = self

        // Do any additional setup after loading the view.
        title = "初始問卷 (4/72)"
        var backbutton = UIBarButtonItem(title: "4/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        yearTextField.becomeFirstResponder()
        
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        user.serviceTimeLength = "0年0月"
    }
    
    func tap() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func clickNext(sender: AnyObject) {
        if let month = Int(monthTextField.text!) {
            // get month first
            // then check year
            var year = "0"
            if yearTextField.text != "" {
                // something in it
                if let y = Int(yearTextField.text!) {
                    // check if year is a number
                    year = "\(y)"
                }
            }
            // after check
            user.serviceTimeLength = "\(year)年\(month)月"
            // perform segue
            self.performSegueWithIdentifier("4 to 5", sender: user)
        } else {
            // clear both text field
            monthTextField.text = ""
            yearTextField.text = ""
            alertError()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "4 to 5" {
            var vc = segue.destinationViewController as! CompanyLevelViewController
            vc.user = user
        }
    }

    func alertError() {
        var alert = UIAlertController(title: "輸入有誤", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        var ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
}

extension HowLongStayingInCompanyViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == yearTextField {
            monthTextField.becomeFirstResponder()
        } else if monthTextField == textField {
            monthTextField.resignFirstResponder()
        }
        return true
    }
}
