//
//  Authoritarian2ViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SupervisorDirectedOCB1ViewController: UIViewController {
    
    
    let fearLevel = ["非常不同意", "不同意", "有點不同意", "有點同意", "同意", "非常同意"]
    var questionare: Questionare!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg-night.jpg")!)
        
        title = "晚間問卷 (26/29)"
        var backbutton = UIBarButtonItem(title: "26/29", style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        // Do any additional setup after loading the view.
        fearLevelPickerView.selectRow(0, inComponent: 0, animated: true)
        questionare.supervisorDirectedOCB1 = fearLevel[0]
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
            let vc = segue.destinationViewController as! SupervisorDirectedOCB2ViewController
            vc.questionare = questionare
        }
    }
    
    
    @IBAction func nextClicked(sender: AnyObject) {
        performSegueWithIdentifier("next", sender: questionare)
    }
}

extension SupervisorDirectedOCB1ViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
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
        questionare.supervisorDirectedOCB1 = fearLevel[row]
    }
}