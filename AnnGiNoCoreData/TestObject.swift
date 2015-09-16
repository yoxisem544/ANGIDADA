//
//  TestObject.swift
//  AnnGiNoCoreData
//
//  Created by David on 2015/9/14.
//  Copyright (c) 2015年 David. All rights reserved.
//

import UIKit
import Parse

public class TestObject: PFObject, PFSubclassing {
    
    @NSManaged var foo: String?
    
    override public class func initialize() {
        struct Static {
            static var onceToken : dispatch_once_t = 0;
        }
        dispatch_once(&Static.onceToken) {
            self.registerSubclass()
        }
    }
    
    public static func parseClassName() -> String {
        return "TestObject"
    }
}
