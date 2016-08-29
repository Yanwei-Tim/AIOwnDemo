//
//  AppDelegatEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/27.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

extension AppDelegate {

}
// MARK: 获取AppDelegate实例对象
let app = UIApplication.sharedApplication().delegate as! AppDelegate

extension UIApplication {
	class func topViewController(base: UIViewController? = UIApplication.sharedApplication().keyWindow?.rootViewController) -> UIViewController? {
		if let nav = base as? UINavigationController {
			return topViewController(nav.visibleViewController)
		}
		if let tab = base as? UITabBarController {
			guard let selected = tab.selectedViewController else { return base }
			return topViewController(selected)
		}
		if let presented = base?.presentedViewController {
			return topViewController(presented)
		}
		return base
	}
}
