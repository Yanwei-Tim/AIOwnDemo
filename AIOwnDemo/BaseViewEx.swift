//
//  BaseViewEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/27.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

extension UINavigationBar {

	// MARK: 去掉NavigationBar的背景和横线
	func removeBGView() {
		let imageView = subviews[0]
		if imageView.isKindOfClass(UIImageView) {
			imageView.removeFromSuperview()
		}
	}
}

extension UITabBar {
	// MARK: 去掉TabBar中的横线和背景
	func removeBGView() {
		// 去掉TabBar中的横线
		let lineView = subviews[subviews.count - 1]
		if lineView.isKindOfClass(UIImageView) {
			lineView.removeFromSuperview()
		}
		// 去掉TabBar中的背景
		let bgView = subviews[0]
		if bgView.isKindOfClass(UIImageView) {
			bgView.removeFromSuperview()
		}
	}
}