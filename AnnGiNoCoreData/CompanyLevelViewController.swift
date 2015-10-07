//
//  CompanyLevelViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class CompanyLevelViewController: UIViewController {

    let companyLevel = ["非主管職", "基層主管", "中階主管", "高階主管"]
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "初始問卷 (5/72)"
        var backbutton = UIBarButtonItem(title: "5/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        companyLevelPickerView.selectRow(0, inComponent: 0, animated: true)
        user.currentRank = companyLevel[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var companyLevelPickerView: UIPickerView!
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "5 to 6" {
            let vc = segue.destinationViewController as! DepartmentPickerViewController
            vc.user = user
        }
    }

    
    @IBAction func nextClicked(sender: AnyObject) {
        self.performSegueWithIdentifier("5 to 6", sender: user)
    }
}

extension CompanyLevelViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return companyLevel[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companyLevel.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(companyLevel[row])
        user.currentRank = companyLevel[row]
    }
}