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
    
    public static func parseClassName() -> String {
        return "Award"
    }
}