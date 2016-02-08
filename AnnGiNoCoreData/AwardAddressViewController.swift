//
//  AwardAddressViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/15.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit

class AwardAddressViewController: UIViewController {

    @IBOutlet weak var contentTextField: UITextField!
    var award: Award!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "地址".localized
        var backbutton = UIBarButtonItem(title: "地址".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        
        contentTextField.delegate = self
        // Do any additional setup after loading the view.
        let tap = UITapGestureRecognizer(target: self, action: "tap")
        view.addGestureRecognizer(tap)
    }
    
    func tap() {
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func nextClicked() {
        if contentTextField.text != "" {
            award.address = contentTextField.text
            performSegueWithIdentifier("next", sender: award)
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! AwardPhoneNumberViewController
            vc.award = sender as! Award
        }
    }
    
    
}

extension AwardAddressViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == contentTextField {
            contentTextField.resignFirstResponder()
        }
        return true
    }
}