//
//  Authoritarian2ViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class ExpectedEmotionalJobDemand5ViewController: UIViewController {
    
    
    let fearLevel = ["非常不同意".localized, "不同意".localized, "有點不同意".localized, "有點同意".localized, "同意".localized, "非常同意".localized]
    var questionare: Questionare!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-morning.jpg")!)
        
        title = "早晨問卷".localized + " (10/20)"
        var backbutton = UIBarButtonItem(title: "10/20", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        fearLevelPickerView.selectRow(0, inComponent: 0, animated: true)
        questionare.expectedEmotionalJobDemand5 = fearLevel[0]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var fearLevelPickerView: UIPickerView!
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! MorningFirstComfirmViewController
            vc.questionare = questionare
        }
    }
    
    
    @IBAction func nextClicked(sender: AnyObject) {
        performSegueWithIdentifier("next", sender: questionare)
    }
}

extension ExpectedEmotionalJobDemand5ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
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
        questionare.expectedEmotionalJobDemand5 = fearLevel[row]
    }
}