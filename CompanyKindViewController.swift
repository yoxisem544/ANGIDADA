//
//  CompanyKindViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit

class CompanyKindViewController: UIViewController {

    let companyKind = ["高科技製造業", "傳統製造業", "金融服務業", "其他服務業", "其他，請填寫。"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "問題一"
        // Do any additional setup after loading the view.
        companyKindPickerView.selectRow(0, inComponent: 0, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var companyKindPickerView: UIPickerView!
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func nextClicked(sender: AnyObject) {

    }
}

extension CompanyKindViewController : UIPickerViewDataSource, UIPickerViewDelegate {
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return companyKind[row]
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return companyKind.count
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println(companyKind[row])
    }
}