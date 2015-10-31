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
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

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
//        presentMainScreen()
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showAlert(completion: () -> Void) {
        let alert = UIAlertController(title: "小提示", message: "我們將於09:00、14:00、18:00提醒您填寫問卷", preferredStyle: UIAlertControllerStyle.Alert)
        let ok = UIAlertAction(title: "好", style: UIAlertActionStyle.Cancel) { (UIAlertAction) -> Void in
            completion()
        }
        alert.addAction(ok)
        presentViewController(alert, animated: true, completion: nil)
    }
    @IBAction func resetDateClicked() {
        if let dayToSet = Int(dayTextField.text!) {
            showAlert({ () -> Void in
                UserSetting.setNextWorkingDay(dayToSet)
                self.presentMainScreen()
            })
        }
    }
    
    func presentMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("main screen") as! UITabBarController
        self.presentViewController(vc, animated: true, completion: nil)
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
