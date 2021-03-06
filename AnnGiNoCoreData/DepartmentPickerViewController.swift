//
//  DepartmentPickerViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class DepartmentPickerViewController: UIViewController {

    let department = ["研發".localized, "行銷".localized, "業務".localized, "採購".localized, "生產".localized, "品管".localized, "客服".localized, "資訊".localized, "財會".localized, "人資".localized, "總務".localized, "公關".localized, "法務".localized, "其他，請填寫。".localized]
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "初始問卷".localized + " (6/72)"
        var backbutton = UIBarButtonItem(title: "6/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        departmentPickerView.selectRow(0, inComponent: 0, animated: true)
        user.currentDepartmentProperty = department[0]
        
        other.delegate = self
        other.enabled = false
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    @IBOutlet weak var other: UITextField!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var departmentPickerView: UIPickerView!
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "6 to 7" {
            let vc = segue.destinationViewController as! CompanyKindViewController
            vc.user = user
        }
    }

    
    @IBAction func nextClicked(sender: AnyObject) {
        print(departmentPickerView)
        if other.enabled {
            user.currentDepartmentProperty = other.text
        }
        if !other.enabled {
            self.performSegueWithIdentifier("6 to 7", sender: user)
        } else {
            if other.text != "" {
                self.performSegueWithIdentifier("6 to 7", sender: user)
            }
        }
    }
}

extension DepartmentPickerViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == other {
            other.resignFirstResponder()
        }
        return true
    }
}

extension DepartmentPickerViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return department[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return department.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(department[row])
        if row == department.count - 1 {
            other.enabled = true
        } else {
            other.enabled = false
            user.currentDepartmentProperty = department[row]
        }
    }
}