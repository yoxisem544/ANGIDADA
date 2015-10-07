//
//  ResetNotiDateViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/7.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class ResetNotiDateViewController: UIViewController {

    @IBOutlet weak var dayTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        dayTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
    }
    
    func tap() {
        self.dayTextField.resignFirstResponder()
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeButtonClicked() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func resetDateClicked() {
        if let dayToSet = Int(dayTextField.text!) {
            UserSetting.setNextWorkingDay(dayToSet)
            closeButtonClicked()
        }
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

extension ResetNotiDateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == dayTextField {
            dayTextField.resignFirstResponder()
        }
        return true
    }
}
