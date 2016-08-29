//
//  UITextField+AutoSize.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/29.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class UITextField_AutoSize: UITextField {

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

extension UITextField {
	// MARK: 如果是小屏, 字体缩小
	func autoFontSize() {
		if UIScreen.isSmallScreen {
			font = UIFont(name: (font?.fontName)!, size: (font?.pointSize)! / 3 * 2)
		}
	}
}
