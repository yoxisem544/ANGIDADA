//
//  EducationalBackgroundPickerViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class EducationalBackgroundPickerViewController: UIViewController {

    let educationBackground = ["高中職以下".localized, "專科".localized, "大學".localized, "碩士".localized, "博士".localized]
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "初始問卷".localized + " (3/72)"
        var backbutton = UIBarButtonItem(title: "3/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        educationBackgroundPickerView.selectRow(0, inComponent: 0, animated: true)
        user.educationalBackground = educationBackground[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var educationBackgroundPickerView: UIPickerView!
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickNext(sender: AnyObject) {
        performSegueWithIdentifier("3 to 4", sender: user)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "3 to 4" {
            var vc = segue.destinationViewController as! HowLongStayingInCompanyViewController
            vc.user = user
        }
    }
}

extension EducationalBackgroundPickerViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return educationBackground[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return educationBackground.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(educationBackground[row])
        user.educationalBackground = educationBackground[row]
    }
}