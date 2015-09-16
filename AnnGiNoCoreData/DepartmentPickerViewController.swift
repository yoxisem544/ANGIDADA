//
//  DepartmentPickerViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class DepartmentPickerViewController: UIViewController {

    let department = ["研發", "行銷", "業務", "採購", "生產", "品管", "客服", "資訊", "財會", "人資", "總務", "公關", "法務", "其他，請填寫。"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "問題一"
        // Do any additional setup after loading the view.
        departmentPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var departmentPickerView: UIPickerView!
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func nextClicked(sender: AnyObject) {
        println(departmentPickerView)
    }
}

extension DepartmentPickerViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return department[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return department.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println(department[row])
    }
}