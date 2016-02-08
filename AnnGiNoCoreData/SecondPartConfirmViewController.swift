//
//  SecondPartConfirmViewController.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/25.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

class SecondPartConfirmViewController: UIViewController {

    var user: PersonalInformation!
    
    override func viewDidLoad() {
        super.viewDidLoad(); self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bg.jpg")!)

        // Do any additional setup after loading the view.
        title = "第二部份確認".localized
        var backbutton = UIBarButtonItem(title: "第二部份確認".localized, style: UIBarButtonItemStyle.Done, target: nil, action: nil)
        self.navigationItem.backBarButtonItem = backbutton
        
		resultTextView.text = "我的直屬主管會嚴格要求部屬，令人敬畏。".localized
		resultTextView.text = resultTextView.text + "\n\(user.authoritarianLeadershipQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "與我的直屬主管一起工作時，他的要求與指示使人感受到很大的壓力。".localized
		resultTextView.text = resultTextView.text + "\n\(user.authoritarianLeadershipQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管會嚴厲責備未能達成任務的部屬。".localized
		resultTextView.text = resultTextView.text + "\n\(user.authoritarianLeadershipQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管採用嚴格的方法進行管理，確保任務達成。".localized
		resultTextView.text = resultTextView.text + "\n\(user.authoritarianLeadershipQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管會明快處置違反他指示與規定的部屬。".localized
		resultTextView.text = resultTextView.text + "\n\(user.authoritarianLeadershipQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管會關懷我私人的生活起居。".localized
		resultTextView.text = resultTextView.text + "\n\(user.benevolentLeadershipQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "當我碰到難題時，我的直屬主管會即時給我鼓勵。".localized
		resultTextView.text = resultTextView.text + "\n\(user.benevolentLeadershipQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "當我工作表現不佳的時候，我的直屬主管會去了解真正的原因何在。".localized
		resultTextView.text = resultTextView.text + "\n\(user.benevolentLeadershipQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管會根據我個人的需要，來滿足我的要求。".localized
		resultTextView.text = resultTextView.text + "\n\(user.benevolentLeadershipQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "對於我在工作上所缺乏的能力，我的直屬主管會給予適當的教育與輔導。".localized
		resultTextView.text = resultTextView.text + "\n\(user.benevolentLeadershipQuestion5)\n\n"
		resultTextView.text = resultTextView.text + "有需要時，我的直屬主管會請我協助處理他的私人事務。".localized
		resultTextView.text = resultTextView.text + "\n\(user.personLifeInclusionQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "在工作以外的時間，我的直屬主管與我仍會互相聯絡、見面。".localized
		resultTextView.text = resultTextView.text + "\n\(user.personLifeInclusionQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "下班後，我的直屬主管會和我一起進行非關工作的社交活動，如用餐、玩樂。".localized
		resultTextView.text = resultTextView.text + "\n\(user.personLifeInclusionQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我的直屬主管相當熟識我的家庭成員，可以直接和他們溝通、聯繫。".localized
		resultTextView.text = resultTextView.text + "\n\(user.personLifeInclusionQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "我願意無條件服從我直屬主管的指示。".localized
		resultTextView.text = resultTextView.text + "\n\(user.deferenceToSupervisorQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "就算意見不同，我最後仍會全力支持我直屬主管做的決定。".localized
		resultTextView.text = resultTextView.text + "\n\(user.deferenceToSupervisorQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我願意犧牲自己以達成我直屬主管所設定的目標。".localized
		resultTextView.text = resultTextView.text + "\n\(user.deferenceToSupervisorQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我願意犧牲自己以維護我直屬主管的利益。".localized
		resultTextView.text = resultTextView.text + "\n\(user.deferenceToSupervisorQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "我會用比職責要求還多的努力來滿足我直屬主管的指示。".localized
		resultTextView.text = resultTextView.text + "\n\(user.generalSupervisorDirectedOCBQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "我會額外付出許多心力讓我直屬主管感到滿意。".localized
		resultTextView.text = resultTextView.text + "\n\(user.generalSupervisorDirectedOCBQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我會自願在職責範圍之外，對我直屬主管提供協助。".localized
		resultTextView.text = resultTextView.text + "\n\(user.generalSupervisorDirectedOCBQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我會試圖達成比我直屬主管所要求水準還要更好的表現。".localized
		resultTextView.text = resultTextView.text + "\n\(user.generalSupervisorDirectedOCBQuestion4)\n\n"
		resultTextView.text = resultTextView.text + "和其它同級主管相比，我直屬主管在工作上相當成功。".localized
		resultTextView.text = resultTextView.text + "\n\(user.perceivedSupervisorEffectivenessQuestion1)\n\n"
		resultTextView.text = resultTextView.text + "我直屬主管的工作表現總是能滿足公司對他的期待。".localized
		resultTextView.text = resultTextView.text + "\n\(user.perceivedSupervisorEffectivenessQuestion2)\n\n"
		resultTextView.text = resultTextView.text + "我直屬主管的工作表現是公司中其他人的楷模。".localized
		resultTextView.text = resultTextView.text + "\n\(user.perceivedSupervisorEffectivenessQuestion3)\n\n"
		resultTextView.text = resultTextView.text + "我直屬主管的整體工作表現相當良好。".localized
		resultTextView.text = resultTextView.text + "\n\(user.perceivedSupervisorEffectivenessQuestion4)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var resultTextView: UITextView!
    
    @IBAction func nextClicked() {
        performSegueWithIdentifier("next", sender: user)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "next" {
            let vc = segue.destinationViewController as! Intensity1ViewController
            vc.user = user
        }
    }


}
