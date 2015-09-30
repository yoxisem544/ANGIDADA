//
//  CompanyKindViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class CompanyKindViewController: UIViewController {

    let companyKind = ["高科技製造業", "傳統製造業", "金融服務業", "其他服務業", "其他，請填寫。"]
    var user: PersonalInformation!
    
    @IBOutlet weak var other: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "初始問卷 (7/72)"
        var backbutton = UIBarButtonItem(title: "7/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        companyKindPickerView.selectRow(0, inComponent: 0, animated: true)
        other.delegate = self
        other.enabled = false
        user.currentCompanyProperty = companyKind[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var companyKindPickerView: UIPickerView!
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "7 to confirm first part" {
            let vc = segue.destinationViewController as! FirstPartConfirmViewController
            vc.user = user
        }
    }

    
    @IBAction func nextClicked(sender: AnyObject) {
        if other.enabled {
            user.currentCompanyProperty = other.text
        }
        self.performSegueWithIdentifier("7 to confirm first part", sender: user)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
}

extension CompanyKindViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == other {
            other.resignFirstResponder()
        }
        return true
    }
}

extension CompanyKindViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return companyKind[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companyKind.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(companyKind[row])
        if row == companyKind.count - 1 {
            other.enabled = true
        } else {
            other.enabled = false
            user.currentCompanyProperty = companyKind[row]
        }
    }
}