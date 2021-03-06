//
//  SixthPartConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/25.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SixthPartConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)
        
        // Do any additional setup after loading the view.
        title = "第六部份確認".localized
        var backbutton = UIBarButtonItem(title: "第六部份確認".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
		resultTextView.text = "主管有獨自做大多數決定的權力，不需經常徵詢部屬的意見。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "主管基於職權為部屬做出重要決定，是理所當然的事情。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "主管應該要獨當一面，不該經常參考部屬的意見。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "主管把部屬當成同輩朋友是有失身分的，應該盡量避免。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "部屬沒有反對主管決策的權力，必須絕對服從。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "主管應負起責任，不該將重要任務交由部屬全權負責。".localized
		resultTextView.text = resultTextView.text + "\n\(user.powerDistanceOrientationQuestion6)\n\n"
		resultTextView.text = resultTextView.text + "部屬的表現或能力不如預期時，主管應更嚴格地要求他，好使他成長。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "部屬的表現或能力不如預期時，主管也不應降低原先設定的標準。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "主管應展現出求好心切與嚴格督促的態度，以使部屬更加成長。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "主管必須嚴格要求表現落後的部屬，才能警惕其他人更加認真。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "主管若不督促、鞭策表現不如預期的部屬，部屬是不可能成長的。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "就算部屬達成預期目標，主管也應繼續指導、督促他，使他表現得更好。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion6)\n\n"
		resultTextView.text = resultTextView.text + "主管應該要展現出恨鐵不成鋼的態度，期待部屬有更佳的表現。".localized
		resultTextView.text = resultTextView.text + "\n\(user.chasteningNormOrientationQuestion7)"
        
    }
    
    func saveToParseAndSaveLocalUserInformation() {
        user.saveInBackgroundWithBlock { (success, error) -> Void in
            if success {
                print("OKOKOK")
                UserSetting.storeUserInformation(self.user)
                UserSetting.userHasFinishedFirstQuestionare()
//                self.presentMainScreen()
                self.performSegueWithIdentifier("next", sender: nil)
            } else {
                // TODO: if fail
            }
        }
    }
    
    func presentMainScreen() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("main screen") as! UITabBarController
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBAction func nextClicked() {
        saveToParseAndSaveLocalUserInformation()
    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        if segue.identifier == "next" {
//            let vc = segue.destinationViewController as! Intensity1ViewController
//            vc.user = user
//        }
    }

}
