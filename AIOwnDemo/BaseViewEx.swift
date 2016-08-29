//
//  BaseViewEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/27.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

let width = UIScreen.mainScreen().bounds.width
let height = UIScreen.mainScreen().bounds.height

extension UINavigationBar {
	// MARK: 去掉NavigationBar的背景和横线
	func removeBGView() {
		let imageView = subviews[0]
		if imageView.isKindOfClass(UIImageView) && width == imageView.bounds.width {
			imageView.removeFromSuperview()
		}
	}

	// MARK: 隐藏
	func hide() {
		hidden = true
	}

	func show() {
		hidden = false
	}

}

extension UITabBar {
	// MARK: 去掉TabBar中的横线和背景
	func removeBGView() {
		// 去掉TabBar中的横线
		let lineView = subviews[subviews.count - 1]
		if lineView.isKindOfClass(UIImageView) && width == lineView.bounds.width {
			lineView.removeFromSuperview()
		}
		// 去掉TabBar中的背景
		let bgView = subviews[0]
		if bgView.isKindOfClass(UIImageView) && width == bgView.bounds.width {
			bgView.removeFromSuperview()
		}
	}

	// MARK: 隐藏
	func hide() {
		hidden = true
	}

	func show() {
		hidden = false
	}
}

//MARK: 扩展导航Item
extension UINavigationItem {
	// MARK:使用自定义的Item标题
	func setTitleText(title: String) {
		self.title = title
		if let titleView = self.titleView {
			if titleView is UILabel {
				let label = titleView as! UILabel
				label.text = title
				label.sizeToFit()
			}
		} else {
			let titleView = UILabel()
			titleView.text = title
			titleView.sizeToFit()
			self.titleView = titleView
		}
	}

	// MARK: 设置标题颜色
	func setTitleColor(color: UIColor) {
		if let titleView = self.titleView {
			if titleView is UILabel {
				(titleView as! UILabel).textColor = color
			}
		} else {
			let titleView = UILabel()
			titleView.text = self.title
			titleView.sizeToFit()
			titleView.textColor = color
			self.titleView = titleView
		}
	}

	func setTitleTextAndColor(color: UIColor, title: String) {
		self.title = title
		if let titleView = self.titleView {
			if titleView is UILabel {
				let label = titleView as! UILabel
				label.text = title
				label.textColor = color
				label.sizeToFit()
			}
		} else {
			let titleView = UILabel()
			titleView.text = title
			titleView.textColor = color
			titleView.sizeToFit()
			self.titleView = titleView
		}
	}

}

extension UIScreen {
	// MARK: 屏幕的宽度, 非像素
	static var width: CGFloat {
		return UIScreen.mainScreen().bounds.width
	}
	// MARK: 屏幕的高度, 非像素
	static var height: CGFloat {
		return UIScreen.mainScreen().bounds.height
	}

	// MARK: IPhone6以下,都判断为小屏
	static var isSmallScreen: Bool {
		return height <= 568
	}
}
