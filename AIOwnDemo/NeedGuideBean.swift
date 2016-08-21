//
//  NeedGuideBean.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class NeedGuideBean: NSObject, NSCoding {

	var needGuide: Bool

	init(needGuide: Bool) {
		self.needGuide = needGuide
		super.init()
	}

	required convenience init?(coder aDecoder: NSCoder) {
		let b = aDecoder.decodeBoolForKey(DataKey.NeedGuideKey)
		self.init(needGuide: b)
	}

	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeBool(needGuide, forKey: DataKey.NeedGuideKey)
	}

}

struct DataKey {
	static let NeedGuideKey = "need_guide_key"
}
