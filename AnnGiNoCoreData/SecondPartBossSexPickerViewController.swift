//
//  SecondPartBossSexPickerViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SecondPartBossSexPickerViewController: UIViewController {

    let sex = ["男性", "女性"]
    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "初始問卷 (8/72)"
        var backbutton = UIBarButtonItem(title: "8/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        sexPickerView.selectRow(0, inComponent: 0, animated: true)
        user.directManagerSex = sex[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var sexPickerView: UIPickerView!
    

    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
        if segue.identifier == "8 to 9" {
            let vc = segue.destinationViewController as! SecondPartBossPeopleViewController
            vc.user = user
        }
    }
    
    
    @IBAction func nextClicked(sender: AnyObject) {
        println(sexPickerView)
        performSegueWithIdentifier("8 to 9", sender: user)
    }
}

extension SecondPartBossSexPickerViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return sex[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sex.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println(sex[row])
        user.directManagerSex = sex[row]
    }
}