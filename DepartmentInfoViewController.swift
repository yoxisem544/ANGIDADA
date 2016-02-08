//
//  DepartmentInfoViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/3.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit
import Parse

class DepartmentInfoViewController: UIViewController {
    
    var user: PersonalInformation!
    var award: Award!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "部門".localized
        var backbutton = UIBarButtonItem(title: "部門".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        
        // Do any additional setup after loading the view.
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        contentTextField.delegate = self
    }
    
    func tap() {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var contentTextField: UITextField!
    
    @IBAction func nextClicked() {
        if contentTextField.text != "" {
            award.department = contentTextField.text
            performSegueWithIdentifier("next", sender: user)
        }
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! AwardEmailViewController
            vc.award = award
        }
    }
    
    
}

extension DepartmentInfoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == contentTextField {
            contentTextField.resignFirstResponder()
        }
        return true
    }
    
}