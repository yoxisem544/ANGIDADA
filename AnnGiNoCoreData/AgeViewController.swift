//
//  AgeViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class AgeViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "初始問卷 (2/72)"
        var backbutton = UIBarButtonItem(title: "2/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        
        // Do any additional setup after loading the view.
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        
        ageTextField.becomeFirstResponder()
        
        user.age = 0
        print(user.age)
    }
    
    func tap() {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var ageTextField: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func clickNext(sender: AnyObject) {
        if let age = Int(ageTextField.text!) {
            user.age = age
            performSegueWithIdentifier("2 to 3", sender: user)
        } else {
            self.ageTextField.text = ""
            alertError()
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "2 to 3" {
            var vc = segue.destinationViewController as! EducationalBackgroundPickerViewController
            vc.user = user
        }
    }
    @IBOutlet weak var clickNext: UIButton!
    
    func alertError() {
        var alert = UIAlertController(title: "輸入有誤", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        var ok = UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(ok)
        self.presentViewController(alert, animated: true) { () -> Void in
            
        }
    }
}

extension AgeViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == ageTextField {
            ageTextField.resignFirstResponder()
        }
        return true
    }
    
}
