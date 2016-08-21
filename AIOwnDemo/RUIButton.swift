//
//  RUIButton.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RUIButton: UIButton {

	/*
	 // Only override drawRect: if you perform custom drawing.
	 // An empty implementation adversely affects performance during animation.
	 override func drawRect(rect: CGRect) {
	 // Drawing code
	 }
	 */
	override init(frame: CGRect) {
		super.init(frame: frame)
		print("\(#function)")
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		print("\(#function)")
//		if let backImage = currentBackgroundImage {
//			frame.size = backImage.size
//		}

		adjustsImageWhenHighlighted = false
		// adjustsImageWhenDisabled = true
	}

//	override func drawRect(rect: CGRect) {
//		backgroundColor = UIColor.redColor()
//		setNeedsDisplay()
//		needsUpdateConstraints()
//		super.drawRect(rect)
//		print("\(#function)")
//
//	}
//
//	override func layoutSubviews() {
//		super.layoutSubviews()
//		print("\(#function)")
//	}
//
//	override func sizeThatFits(size: CGSize) -> CGSize {
//		return CGSize(width: 10, height: 10)
//	}

//	override func intrinsicContentSize() -> CGSize {
//		print("\(#function)")
//		return CGSize(width: 10, height: 10)
//	}
}
