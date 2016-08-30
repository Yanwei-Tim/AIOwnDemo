//
//  BaseEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import Foundation
extension String.CharacterView.Index {
	func toInt() -> Int {
		return Int(toString())!
	}
	func toString() -> String {
		return String(self)
	}
}
