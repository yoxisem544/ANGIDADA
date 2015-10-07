//
//  SecondPartWorkTogetherTimeViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/23.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SecondPartWorkTogetherTimeViewController: UIViewController {

    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var monthTextField: UITextField!
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        title = "初始問卷 (10/72)"
        var backbutton = UIBarButtonItem(title: "10/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        yearTextField.delegate = self
        monthTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked(sender: AnyObject) {
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
            user.timeSpentWithDirectManager = "\(year)年\(month)月"
            // perform segue
            self.performSegueWithIdentifier("10 to middle of second part", sender: user)
        } else {
            // clear both text field
            monthTextField.text = ""
            yearTextField.text = ""
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "10 to middle of second part" {
            let vc = segue.destinationViewController as! MiddleOfSecondPartViewController
            vc.user = user
        }
    }


}
extension SecondPartWorkTogetherTimeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == yearTextField {
            monthTextField.becomeFirstResponder()
        } else if monthTextField == textField {
            monthTextField.resignFirstResponder()
        }
        return true
    }
}
