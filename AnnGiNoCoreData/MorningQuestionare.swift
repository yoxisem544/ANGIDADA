//
//  MorningQuestionare.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/10.
//  Copyright © 2015年 David. All rights reserved.
//

import Foundation
import Parse

public class Questionare : PFObject, PFSubclassing {
    
    // this is the index of the questionare
    @NSManaged var index: Int
    // who do this questionare
    @NSManaged var userName: String!
    // user uuid
    @NSManaged var userUUID: String!
    
    // contents
    // MARK: - morning
//    (1)	今天我必須在短時間內，完成所交付的工作任務。
    @NSManaged var expectedQuantitativeJobDemand1: String!
//    (2)	今天我必須非常努力，才有可能完成工作任務。
    @NSManaged var expectedQuantitativeJobDemand2: String!
//    (3)	今天我必須格外費心，才能圓滿達成工作任務。
    @NSManaged var expectedQuantitativeJobDemand3: String!
//    (4)	今天我必須超時工作，才能如期完成工作任務。
    @NSManaged var expectedQuantitativeJobDemand4: String!
//    (5)	為完成工作任務，我今天必須同時滿足不同對象的要求。
    @NSManaged var expectedQuantitativeJobDemand5: String!
    
//    (1)	我今天在工作中，必須面對很難搞的接觸對象。
    @NSManaged var expectedEmotionalJobDemand1: String!
//    (2)	我今天在工作中，必須設法說服他人接受我的提議。
    @NSManaged var expectedEmotionalJobDemand2: String!
//    (3)	我今天必須在工作中控制或展現情緒，會相當吃力。
    @NSManaged var expectedEmotionalJobDemand3: String!
//    (4)	我今天可能會在工作中遭遇使自己心情受影響的事。
    @NSManaged var expectedEmotionalJobDemand4: String!
//    (5)	我今天可能會在工作中經歷使自己難受、生氣的情況。
    @NSManaged var expectedEmotionalJobDemand5: String!
    
    // second part
//    (1)	對工作任務的內容與程序給予仔細的指示、嚴格要求。
    @NSManaged var authoritarianLeadershipNeeded1: String!
//    (2)	清楚傳達工作要求與指示，並訂定明確的任務完成時限。
    @NSManaged var authoritarianLeadershipNeeded2: String!
//    (3)	嚴厲責備未能達成任務的部屬。
    @NSManaged var authoritarianLeadershipNeeded3: String!
//    (4)	採用嚴格的方法進行管理，確保任務達成。
    @NSManaged var authoritarianLeadershipNeeded4: String!
//    (5)	明快處置違反他指示與規定的部屬。
    @NSManaged var authoritarianLeadershipNeeded5: String!

//    (1)	關懷我私人的生活起居。
    @NSManaged var benevolentLeadershipNeeded1: String!
//    (2)	當我碰到難題時，即時給我鼓勵。
    @NSManaged var benevolentLeadershipNeeded2: String!
//    (3)	當我工作表現不佳的時候，積極了解真正的原因何在。
    @NSManaged var benevolentLeadershipNeeded3: String!
//    (4)	根據我個人的需要，來滿足我的要求。
    @NSManaged var benevolentLeadershipNeeded4: String!
//    (5)	對於我在工作上所缺乏的能力，給予適當的教育與輔導。
    @NSManaged var benevolentLeadershipNeeded5: String!
    
    // MARK: - noon
//    1.	Authoritarian leadership received (Cheng et al., 2014)
//    (1)	對工作任務的內容與程序給予仔細的指示、嚴格要求。
    @NSManaged var authoritarianLeadershipReceived1: String!
//    (2)	清楚傳達工作要求與指示，並訂定明確的任務完成時限。
    @NSManaged var authoritarianLeadershipReceived2: String!
//    (3)	嚴厲責備未能達成任務的部屬。
    @NSManaged var authoritarianLeadershipReceived3: String!
//    (4)	採用嚴格的方法進行管理，確保任務達成。
    @NSManaged var authoritarianLeadershipReceived4: String!
//    (5)	明快處置違反他指示與規定的部屬。
    @NSManaged var authoritarianLeadershipReceived5: String!
//    2.	Benevolent leadership received (Cheng et al., 2014)
//    (1)	關懷我私人的生活起居。
    @NSManaged var benevolentLeadershipReceived1: String!
//    (2)	當我碰到難題時，即時給我鼓勵。
    @NSManaged var benevolentLeadershipReceived2: String!
//    (3)	當我工作表現不佳的時候，積極了解真正的原因何在。
    @NSManaged var benevolentLeadershipReceived3: String!
//    (4)	根據我個人的需要，來滿足我的要求。
    @NSManaged var benevolentLeadershipReceived4: String!
//    (5)	對於我在工作上所缺乏的能力，給予適當的教育與輔導。
    @NSManaged var benevolentLeadershipReceived5: String!
    
    // MARK: - night
//    1.	Positive affect (Watson, Clark, & Tellegan, 1988)
    //    (1) 新奇有趣
    @NSManaged var positiveAffect1: String!
    //    (2) 感覺興奮
    @NSManaged var positiveAffect2: String!
    //    (3) 充滿活力
    @NSManaged var positiveAffect3: String!
    //    (4) 充滿熱忱
    @NSManaged var positiveAffect4: String!
    //    (5) 肯定自我
    @NSManaged var positiveAffect5: String!
    //    (6) 思路敏捷
    @NSManaged var positiveAffect6: String!
    //    (7) 受到激勵
    @NSManaged var positiveAffect7: String!
    //    (8) 意志堅決
    @NSManaged var positiveAffect8: String!
    //    (9) 全神貫注
    @NSManaged var positiveAffect9: String!
    //    (10)主動積極
    @NSManaged var positiveAffect10: String!
//    2.	Negative affect (Watson et al., 1988)
    //    (1) 痛苦憂傷
    @NSManaged var negativeAffect1: String!
    //    (2) 心煩意亂
    @NSManaged var negativeAffect2: String!
    //    (3) 有罪惡感
    @NSManaged var negativeAffect3: String!
    //    (4) 受到驚嚇
    @NSManaged var negativeAffect4: String!
    //    (5) 憤恨不平
    @NSManaged var negativeAffect5: String!
    //    (6) 急躁易怒
    @NSManaged var negativeAffect6: String!
    //    (7) 心生愧疚
    @NSManaged var negativeAffect7: String!
    //    (8) 心神不寧
    @NSManaged var negativeAffect8: String!
    //    (9) 緊張不安
    @NSManaged var negativeAffect9: String!
    //    (10)擔心害怕
    @NSManaged var negativeAffect10: String!
//    3.	Job satisfaction (Ilies et al., 2009)
//    (1)	我感覺自己從今天的工作中獲得真正的快樂。
    @NSManaged var jobSatisfaction1: String!
//    (2)	今天大多數的時間裡，我都對自己的工作充滿熱情。
    @NSManaged var jobSatisfaction2: String!
//    (3)	我對自己今天的工作成果感覺相當滿意。
    @NSManaged var jobSatisfaction3: String!
//    (4)	我今天工作中的每一分鐘都像是度日如年。(r)
    @NSManaged var jobSatisfaction4: String!
//    (5)	今天的工作令我感覺很不愉快。(r)
    @NSManaged var jobSatisfaction5: String!
    
//    4.	Supervisor-directed OCB
//    (1)	在今天的工作中，我用比職責要求還多的努力來滿足我直屬主管的指示。
    @NSManaged var supervisorDirectedOCB1: String!
//    (2)	在今天的工作中，我額外付出許多心力讓我直屬主管感到滿意。
    @NSManaged var supervisorDirectedOCB2: String!
//    (3)	在今天的工作中，我自願在職責範圍之外，對我直屬主管提供協助。
    @NSManaged var supervisorDirectedOCB3: String!
//    (4)	在今天的工作中，我試圖達成比我直屬主管所要求水準還要更好的表現。
    @NSManaged var supervisorDirectedOCB4: String!


    
    override init() {
        super.init()
    }
    
    func retrieveUserInfo() {
        userName = UserSetting.userName()
        userUUID = UserSetting.userUUID()
        index = UserSetting.everydayQuestionareCount() + 1
    }
    
    
    struct KeyOfQuestionare {
        static let tempOfQuestionareId = "tempOfQuestionareId"
    }
    
    func saveToParse(success: () -> Void, failure: () -> Void) {
        // save to parse
        self.saveInBackgroundWithBlock { (successed, error) -> Void in
            if successed {
                // ok saving to parse
                // save object id to local
                let ud = NSUserDefaults.standardUserDefaults()
                ud.setObject(self.objectId, forKey: KeyOfQuestionare.tempOfQuestionareId)
                ud.synchronize()
                success()
            } else {
                failure()
            }
        }
    }
    func retrieveUnfinishedQuestionareId() -> String? {
        let ud = NSUserDefaults.standardUserDefaults()
        if let id = ud.objectForKey(KeyOfQuestionare.tempOfQuestionareId) as? String {
            return id
        }
        return nil
    }
    func retrieveUnfinishedQuestionare(completion: (questionare: Questionare?) -> Void) {
        let query = PFQuery(className: self.parseClassName)
        if let questionareId = retrieveUnfinishedQuestionareId() {
            query.whereKey("objectId", equalTo: questionareId)
            query.findObjectsInBackgroundWithBlock({ (objects, error) -> Void in
                if error == nil {
                    if objects?.count == 1 {
                        if let object = objects![0] as? Questionare {
                            completion(questionare: object)
                        }
                    }
                } else {
                    completion(questionare: nil)
                }
            })
        }
    }
    
    
    // MARK: - initializer
    override public class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    public static func parseClassName() -> String {
        return "Questionare"
    }
}