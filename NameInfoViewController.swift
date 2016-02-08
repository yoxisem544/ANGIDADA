//
//  NameInfoViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/3.
//  Copyright © 2015年 David. All rights reserved.
//

import UIKit
import Parse

class NameInfoViewController: UIViewController {
    
    var user: PersonalInformation!

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
        user = PersonalInformation()
        user.userUUID = NSUUID().UUIDString
        var tap = UITapGestureRecognizer(target: self, action: "tap")
        self.view.addGestureRecognizer(tap)
        contentTextField.delegate = self
        title = "基本資料".localized
        var backbutton = UIBarButtonItem(title: "返回".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
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
            user.userName = contentTextField.text
            performSegueWithIdentifier("next", sender: user)
        }
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! TelInfoViewController
            vc.user = user
        }
    }


}

extension NameInfoViewController : UITextFieldDelegate {
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if textField == contentTextField {
            contentTextField.resignFirstResponder()
        }
        return true
    }
    
}
