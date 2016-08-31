//
//  ViewControllerEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit
extension UIViewController {
	// MARK: 显示标准的2个按钮的对话框
	func showAlertView(title title: String? = nil, message: String? = nil, preferredStyle: UIAlertControllerStyle = .Alert,
		cancelTitle: String? = "取消", okTitle: String? = "确定", onCancel: ((UIAlertAction) -> Void)? = nil, onOk: ((UIAlertAction) -> Void)? = nil) {
			let alertView = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)

			if let cancelTitle = cancelTitle {
				alertView.addAction(UIAlertAction(title: cancelTitle, style: .Cancel, handler: onCancel))
			}

			if let okTitle = okTitle {
				alertView.addAction(UIAlertAction(title: okTitle, style: .Default, handler: onOk))
			}
			presentViewController(alertView, animated: true, completion: nil)
	}

	func hideNavigationBar() {
		navigationController?.navigationBar.hide()
	}
	func showNavigationBar() {
		navigationController?.navigationBar.show()
	}
	func removeNavigationBarBackground() {
		navigationController?.navigationBar.removeBGView()
	}

	func hideTabBar() {
		tabBarController?.tabBar.hide()
	}
	func showTabBar() {
		tabBarController?.tabBar.show()
	}
	func removeTabBarBackground() {
		tabBarController?.tabBar.removeBGView()
	}
}