//
//  Authoritarian2ViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class PerceivedSupervisorEffectiveness2ViewController: UIViewController {
    
    
    let fearLevel = ["非常不同意".localized, "不同意".localized, "有點不同意".localized, "有點同意".localized, "同意".localized, "非常同意".localized]
    var user: PersonalInformation!

    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        title = "初始問卷".localized + " (34/72)"
        var backbutton = UIBarButtonItem(title: "34/72", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        fearLevelPickerView.selectRow(0, inComponent: 0, animated: true)
        user.perceivedSupervisorEffectivenessQuestion2 = fearLevel[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var fearLevelPickerView: UIPickerView!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! PerceivedSupervisorEffectiveness3ViewController
            vc.user = user
        }
    }
    
    
    @IBAction func nextClicked(sender: AnyObject) {
        performSegueWithIdentifier("next", sender: user)
    }
}

extension PerceivedSupervisorEffectiveness2ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return fearLevel[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return fearLevel.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(fearLevel[row])
        user.perceivedSupervisorEffectivenessQuestion2 = fearLevel[row]
    }
}