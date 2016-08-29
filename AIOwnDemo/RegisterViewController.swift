//
//  RegisterViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/28.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		navigationController?.navigationBar.show()
		navigationController?.navigationBar.removeBGView()
		navigationItem.setTitleColor(UIColor.whiteColor())
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

	// MARK: 白色状态栏
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	// MARK: 不隐藏状态栏
	override func prefersStatusBarHidden() -> Bool {
		return false
	}

}
