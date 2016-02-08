//
//  StringExtension.swift
//  AnnGiNoCoreData
//
//  Created by David on 2016/2/8.
//  Copyright © 2016年 David. All rights reserved.
//

import Foundation

extension String {
	var localized: String {
		return NSLocalizedString(self, tableName: "Localized", bundle: NSBundle.mainBundle(), value: "", comment: "")
	}
}