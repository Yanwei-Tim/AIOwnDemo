//
//  UIButton+AutoSize.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/29.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class UIButton_AutoSize: UIButton {

	/*
	 // Only override drawRect: if you perform custom drawing.
	 // An empty implementation adversely affects performance during animation.
	 override func drawRect(rect: CGRect) {
	 // Drawing code
	 }
	 */

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		autoFontSize()
	}

}

extension UIButton {
	// MARK: 如果是小屏, 字体缩小
	func autoFontSize() {
		if UIScreen.isSmallScreen {
			if let font = titleLabel?.font {
				titleLabel?.font = UIFont(name: font.fontName, size: font.pointSize / 3 * 2)
			}
		}
	}
}
