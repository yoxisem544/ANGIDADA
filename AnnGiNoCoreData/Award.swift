//
//  Award.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/10/15.
//  Copyright © 2015年 David. All rights reserved.
//

import Foundation
import Parse

public class Award: PFObject, PFSubclassing {
    
    @NSManaged var name: String!
    @NSManaged var company: String!
    @NSManaged var department: String!
    @NSManaged var email: String!
    @NSManaged var zipCode: String!
    @NSManaged var address: String!
    @NSManaged var phoneNumber: String!
    
    @NSManaged var userName: String!
    @NSManaged var userUUID: String!
	
//	Affective trust to supervisor (Chen, Eberly, Chiang, Cheng, & Farh, 2014)
//	1. 我能自在地向我的直屬主管分享自己的想法、感受和希望。
	@NSManaged var affectiveTrustToSupervisor1: String!
//	2. 我能自在地告訴我的直屬主管自己在工作上所遇到的困難，也知道他一定會認真傾聽。
	@NSManaged var affectiveTrustToSupervisor2: String!
//	3. 若我告訴我的直屬主管自己目前所遭遇的問題，他一定會給我溫暖且有建設性的回應。
	@NSManaged var affectiveTrustToSupervisor3: String!
	
//	Paternalistic relational identity
//	1. 不論是工作或生活，我的直屬主管都像家長一樣地關心、要求我。
	@NSManaged var paternalisticRelationalIdentity1: String!
//	2. 我的直屬主管就像是我的家長，我有責任要回報他的教誨與照顧。
	@NSManaged var paternalisticRelationalIdentity2: String!
//	3. 我的直屬主管和我之間的關係就如同家長與子女一樣。
	@NSManaged var paternalisticRelationalIdentity3: String!
//	4. 我的直屬主管把我的單位營造成一個家，而他就像是撐起這個家的大家長。
	@NSManaged var paternalisticRelationalIdentity4: String!
//	5. 我的直屬主管就像是家長一般地盡責，值得我敬重與服從。
	@NSManaged var paternalisticRelationalIdentity5: String!
//	6. 不論是管教或提攜，都表現出我的直屬主管希望我成長、變得更好的用心。
	@NSManaged var paternalisticRelationalIdentity6: String!
	
//	Leader-member exchange (LMX-7)
//	1. 我清楚知道我直屬主管是否滿意我的工作表現。
	@NSManaged var leaderMemberExchange1: String!
//	2. 我的直屬主管非常了解我在工作上遇到的問題與需要。
	@NSManaged var leaderMemberExchange2: String!
//	3. 我的直屬主管非常了解我的工作潛力。
	@NSManaged var leaderMemberExchange3: String!
//	4. 不論職權高低，我的直屬主管非常願意協助我解決工作上的問題。
	@NSManaged var leaderMemberExchange4: String!
//	5. 不論職權高低，我的直屬主管非常願意犧牲個人利益來幫助我擺脫工作困境。
	@NSManaged var leaderMemberExchange5: String!
//	6. 我信任我的直屬主管，即使他不在場，我也會支持、辯護他的決策。
	@NSManaged var leaderMemberExchange6: String!
//	7. 我和我直屬主管之間具有良好的工作關係。
	@NSManaged var leaderMemberExchange7: String!

	
    
    override init() {
        super.init()
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
	
	public func retrieveAward(complete: (count: Int) -> Void) {
		let query = PFQuery(className: self.parseClassName)
		if let uuid = UserSetting.userUUID() {
			query.whereKey("userUUID", equalTo: uuid)
			query.findObjectsInBackgroundWithBlock({ (objects, error) in
				if error == nil {
					if let objects = objects as? [Award] {
						if objects.count > 0 {
							complete(count: 1)
						} else {
							complete(count: 0)
						}
					}
				}
			})
		}
	}
	
    public static func parseClassName() -> String {
        return "Award"
    }
}