//
//  TextFieldEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit
extension UITextField {
	// MARK: 设置占位字符串的颜色
	func setPlaceholderLabelColor(color: UIColor?) {
		setValue(color, forKeyPath: "placeholderLabel.textColor")
	}

	// MARK: 返回编辑框内容是否为空
	func isTextEmpty() -> Bool {
		if let text = text {
			return text.isEmpty
		}
		return true
	}
}