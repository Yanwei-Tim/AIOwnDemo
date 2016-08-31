//
//  NavMainViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/31.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class NavMainViewController: UINavigationController {

	override func childViewControllerForStatusBarStyle() -> UIViewController? {
		return topViewController
	}

}
