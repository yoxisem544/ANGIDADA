//
//  PersonalInformation.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/16.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

public class PersonalInformation: PFObject, PFSubclassing {
    
    // MARK: - First part
    @NSManaged var userUUID: String!
    @NSManaged var age: Int
    @NSManaged var educationalBackground: String!
    @NSManaged var serviceTimeLength: String!
    @NSManaged var currentRank: String!
    @NSManaged var currentDepartmentProperty: String!
    @NSManaged var currentCompanyProperty: String!
    
    // MARK: Second part
    @NSManaged var directManagerSex: String!
    @NSManaged var peopleThatDirectManagerManaged: Int
    @NSManaged var timeSpentWithDirectManager: String!
    
    // experience
    //   1. Authoritarian leadership (Cheng et al., 2014)
    //   1. 我的直屬主管會嚴格要求部屬，令人敬畏。
    @NSManaged var authoritarianLeadershipQuestion1: Int
    //   2. 與我的直屬主管一起工作時，他的要求與指示使人感受到很大的壓力。
    @NSManaged var authoritarianLeadershipQuestion2: Int
    //   3. 我的直屬主管會嚴厲責備未能達成任務的部屬。
    @NSManaged var authoritarianLeadershipQuestion3: Int
    //   4. 我的直屬主管採用嚴格的方法進行管理，確保任務達成。
    @NSManaged var authoritarianLeadershipQuestion4: Int
    //   5. 我的直屬主管會明快處置違反他指示與規定的部屬。
    @NSManaged var authoritarianLeadershipQuestion5: Int
    
    //   2. Benevolent leadership (Cheng et al., 2014)
    //   1. 我的直屬主管會關懷我私人的生活起居。
    @NSManaged var benevolentLeadershipQuestion1: Int
    //   2. 當我碰到難題時，我的直屬主管會即時給我鼓勵。
    @NSManaged var benevolentLeadershipQuestion2: Int
    //   3. 當我工作表現不佳的時候，我的直屬主管會去了解真正的原因何在。
    @NSManaged var benevolentLeadershipQuestion3: Int
    //   4. 我的直屬主管會根據我個人的需要，來滿足我的要求。
    @NSManaged var benevolentLeadershipQuestion4: Int
    //   5. 對於我在工作上所缺乏的能力，我的直屬主管會給予適當的教育與輔導。
    @NSManaged var benevolentLeadershipQuestion5: Int
    
    //   3. Person-life inclusion (Chen, Friedman, Yu, Fang, & Lu, 2009)
    //   1. 有需要時，我的直屬主管會請我協助處理他的私人事務。
    @NSManaged var personLifeInclusionQuestion1: Int
    //   2. 在工作以外的時間，我的直屬主管與我仍會互相聯絡、見面。
    @NSManaged var personLifeInclusionQuestion2: Int
    //   3. 下班後，我的直屬主管會和我一起進行非關工作的社交活動，如用餐、玩樂。
    @NSManaged var personLifeInclusionQuestion3: Int
    //   4. 我的直屬主管相當熟識我的家庭成員，可以直接和他們溝通、聯繫。
    @NSManaged var personLifeInclusionQuestion4: Int
    
    //  4. Deference to supervisor (Chen et al., 2009)
    //   1. 我願意無條件服從我直屬主管的指示。
    @NSManaged var deferenceToSupervisorQuestion1: Int
    //   2. 就算意見不同，我最後仍會全力支持我直屬主管做的決定。
    @NSManaged var deferenceToSupervisorQuestion2: Int
    //   3. 我願意犧牲自己以達成我直屬主管所設定的目標。
    @NSManaged var deferenceToSupervisorQuestion3: Int
    //   4. 我願意犧牲自己以維護我直屬主管的利益。
    @NSManaged var deferenceToSupervisorQuestion4: Int
    
    //  5. General supervisor-directed OCB
    //   1. 我會用比職責要求還多的努力來滿足我直屬主管的指示。
    @NSManaged var generalSupervisorDirectedOCBQuestion1: Int
    //   2. 我會額外付出許多心力讓我直屬主管感到滿意。
    @NSManaged var generalSupervisorDirectedOCBQuestion2: Int
    //   3. 我會自願在職責範圍之外，對我直屬主管提供協助。
    @NSManaged var generalSupervisorDirectedOCBQuestion3: Int
    //   4. 我會試圖達成比我直屬主管所要求水準還要更好的表現。
    @NSManaged var generalSupervisorDirectedOCBQuestion4: Int
    
    //  6. Perceived supervisor effectiveness (Denison, Hoojiberg, & Quinn, 1995)
    //   1. 和其它同級主管相比，我直屬主管在工作上相當成功。
    @NSManaged var perceivedSupervisorEffectivenessQuestion1: Int
    //   2. 我直屬主管的工作表現總是能滿足公司對他的期待。
    @NSManaged var perceivedSupervisorEffectivenessQuestion2: Int
    //   3. 我直屬主管的工作表現是公司中其他人的楷模。
    @NSManaged var perceivedSupervisorEffectivenessQuestion3: Int
    //   4. 我直屬主管的整體工作表現相當良好。
    @NSManaged var perceivedSupervisorEffectivenessQuestion4: Int
    
    // MARK: - Third part
    //    第三部分：本部分是想瞭解您與您直屬主管之間的溝通模式。針對每一個問題，請您評估該種溝通模式的發生頻率，並選擇最適當的程度選項。
    //  7. Intensity of supervisor-subordinate interaction (與主管互動形式的頻率高低)
    //   1. 面對面進行互動。
    @NSManaged var intensityOfSupervisorSubordinateInteractionQuestion1: Int
    //   2. 使用電子郵件進行互動。
    @NSManaged var intensityOfSupervisorSubordinateInteractionQuestion2: Int
    //   3. 在電話中進行互動。
    @NSManaged var intensityOfSupervisorSubordinateInteractionQuestion3: Int
    //   4. 使用即時通訊軟體進行互動。
    @NSManaged var intensityOfSupervisorSubordinateInteractionQuestion4: Int
    //   5. 使用內部簽核系統進行互動。
    @NSManaged var intensityOfSupervisorSubordinateInteractionQuestion5: Int
    
    // MARK: - Fourth Part
    //    第四部分：本部分是想瞭解您在工作中的感受。請根據您在目前職務上的工作經驗，針對以下各敘述句進行評估，選擇最適當的程度選項。
    //
    //    （1非常不同意，2不同意，3有點不同意，4有點同意，5同意，6非常同意）
    //
    //    8. Trait job satisfaction (Ilies, Wilson, & Wagner, 2009) [根據目前工作經驗填答]
    //   1. 我能從工作中獲得真正的快樂。
    @NSManaged var traitJobSatisfactionQuestion1: Int
    //   2. 大多數時候，我都對自己的工作充滿熱情。
    @NSManaged var traitJobSatisfactionQuestion2: Int
    //   3. 我對自己的工作成果相當滿意。
    @NSManaged var traitJobSatisfactionQuestion3: Int
    //   4. 我工作中的每一分鐘都像是度日如年。(r)
    @NSManaged var traitJobSatisfactionQuestion4: Int
    //   5. 工作令我感覺很不愉快。(r)
    @NSManaged var traitJobSatisfactionQuestion5: Int
    
    //    9. Competence (Spreitzer, 1995)
    //   1. 我對自己的完成工作的能力深具信心。
    @NSManaged var competenceQuestion1: Int
    //   2. 我確信自己具備完成工作所需的各種能力。
    @NSManaged var competenceQuestion2: Int
    //   3. 我已精通完成工作所需的相關技能。
    @NSManaged var competenceQuestion3: Int
    
    // MARK: - Fifth Part
    //    第五部分：本部分是想瞭解您對工作任務的看法。請根據您目前的工作情況，針對以下各敘述句進行評估，選擇最適當的程度選項。
    //
    //    （1非常不同意，2不同意，3有點不同意，4有點同意，5同意，6非常同意）
    //
    //    10. Quantitative job demand (workload) (Schaufeli & Bakker, 2004)
    //   1. 我常必須在短時間內，完成所交付的工作任務。
    @NSManaged var quantitativeJobDemandQuestion1: Int
    //   2. 我常必須非常努力，才有可能完成工作任務。
    @NSManaged var quantitativeJobDemandQuestion2: Int
    //   3. 我常必須格外費心，才能圓滿達成工作任務。
    @NSManaged var quantitativeJobDemandQuestion3: Int
    //   4. 我常必須超時工作，才能如期完成工作任務。
    @NSManaged var quantitativeJobDemandQuestion4: Int
    //   5. 為完成工作任務，我常必須同時滿足不同對象的要求。
    @NSManaged var quantitativeJobDemandQuestion5: Int
    
    //    11. Emotional job demand (Schaufeli & Bakker, 2004))
    //   1. 在工作中，我常必須面對很難搞的接觸對象。
    @NSManaged var emotionalJobDemandQuestion1: Int
    //   2. 在工作中，我常必須設法說服他人接受我的提議。
    @NSManaged var emotionalJobDemandQuestion2: Int
    //   3. 我常必須在工作中控制或展現情緒，會相當吃力。
    @NSManaged var emotionalJobDemandQuestion3: Int
    //   4. 我常會在工作中遭遇使自己心情受影響的事。
    @NSManaged var emotionalJobDemandQuestion4: Int
    //   5. 我常會在工作中經歷使自己難受、生氣的情況。
    @NSManaged var emotionalJobDemandQuestion5: Int
    
    // MARK: - Sixth Part
    //    第六部分：本部分是想瞭解您對於主管、部屬互動關係的一般性看法，並不侷限在您與目前直屬主管的互動經驗。請針對以下各敘述句進行評估，選擇最適當的程度選項。
    //
    //    （1非常不同意，2不同意，3有點不同意，4有點同意，5同意，6非常同意）
    //
    //    12. Power distance orientation (Dorfman & Howell, 1988)
    //   1. 主管有獨自做大多數決定的權力，不需經常徵詢部屬的意見。
    @NSManaged var powerDistanceOrientationQuestion1: Int
    //   2. 主管基於職權為部屬做出重要決定，是理所當然的事情。
    @NSManaged var powerDistanceOrientationQuestion2: Int
    //   3. 主管應該要獨當一面，不該經常參考部屬的意見。
    @NSManaged var powerDistanceOrientationQuestion3: Int
    //   4. 主管把部屬當成同輩朋友是有失身分的，應該盡量避免。
    @NSManaged var powerDistanceOrientationQuestion4: Int
    //   5. 部屬沒有反對主管決策的權力，必須絕對服從。
    @NSManaged var powerDistanceOrientationQuestion5: Int
    //   6. 主管應負起責任，不該將重要任務交由部屬全權負責。
    @NSManaged var powerDistanceOrientationQuestion6: Int
    
    //    13. Chastening norm orientation (修改自王中豫, 2013)
    //   1. 部屬的表現或能力不如預期時，主管應更嚴格地要求他，好使他成長。
    @NSManaged var chasteningNormOrientationQuestion1: Int
    //   2. 部屬的表現或能力不如預期時，主管也不應降低原先設定的標準。
    @NSManaged var chasteningNormOrientationQuestion2: Int
    //   3. 主管應展現出求好心切與嚴格督促的態度，以使部屬更加成長。
    @NSManaged var chasteningNormOrientationQuestion3: Int
    //   4. 主管必須嚴格要求表現落後的部屬，才能警惕其他人更加認真。
    @NSManaged var chasteningNormOrientationQuestion4: Int
    //   5. 主管若不督促、鞭策表現不如預期的部屬，部屬是不可能成長的。
    @NSManaged var chasteningNormOrientationQuestion5: Int
    //   6. 就算部屬達成預期目標，主管也應繼續指導、督促他，使他表現得更好。
    @NSManaged var chasteningNormOrientationQuestion6: Int
    //   7. 主管應該要展現出恨鐵不成鋼的態度，期待部屬有更佳的表現。
    @NSManaged var chasteningNormOrientationQuestion7: Int

    
    
    override init() {
        super.init()
        userUUID = "只是個側側"
        age = 100
        educationalBackground = "yoyo"
        serviceTimeLength = "oasjidioaijoiw"
        currentRank = "jhsasjk"
        currentDepartmentProperty  = "jhsasjk"
        currentCompanyProperty  = "jhsasjk"
        directManagerSex  = "jhsasjk"
        peopleThatDirectManagerManaged = 7
        timeSpentWithDirectManager = "sa"
        authoritarianLeadershipQuestion1 = 10
        authoritarianLeadershipQuestion2 = 10
        authoritarianLeadershipQuestion3 = 10
        authoritarianLeadershipQuestion4 = 10
        authoritarianLeadershipQuestion5 = 10
        benevolentLeadershipQuestion1 = 10
        benevolentLeadershipQuestion2 = 10
        benevolentLeadershipQuestion3 = 10
        benevolentLeadershipQuestion4 = 10
        benevolentLeadershipQuestion5 = 10
        personLifeInclusionQuestion1 = 10
        personLifeInclusionQuestion2 = 10
        personLifeInclusionQuestion3 = 10
        personLifeInclusionQuestion4 = 10
        deferenceToSupervisorQuestion1 = 10
        deferenceToSupervisorQuestion2 = 10
        deferenceToSupervisorQuestion3 = 10
        deferenceToSupervisorQuestion4 = 10
        generalSupervisorDirectedOCBQuestion1 = 10
        generalSupervisorDirectedOCBQuestion2 = 10
        generalSupervisorDirectedOCBQuestion3 = 10
        generalSupervisorDirectedOCBQuestion4 = 10
        perceivedSupervisorEffectivenessQuestion1 = 10
        perceivedSupervisorEffectivenessQuestion2 = 10
        perceivedSupervisorEffectivenessQuestion3 = 10
        perceivedSupervisorEffectivenessQuestion4 = 10
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
        return "PersonalInformation"
    }
}
