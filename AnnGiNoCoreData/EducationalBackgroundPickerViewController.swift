//
//  EducationalBackgroundPickerViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class EducationalBackgroundPickerViewController: UIViewController {

    let educationBackground = ["高中職以下", "專科", "大學", "碩士", "博士"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "問題一"
        // Do any additional setup after loading the view.
        educationBackgroundPickerView.selectRow(0, inComponent: 0, animated: true)
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
    
    @IBAction func nextClicked(sender: AnyObject) {
        println(educationBackgroundPickerView)
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
        println(educationBackground[row])
    }
}