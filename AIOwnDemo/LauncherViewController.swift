//
//  LoginViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class LauncherViewController: UIViewController {

	@IBOutlet weak var stackView: UIStackView!

	var isNeesGuide: Bool = true

	var test: Bool!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		// checkNeedShowGuideViewController()
//		stackView.hidden = true
		isNeesGuide = true

		stackView.alpha = 0

		navigationController?.navigationBar.hide()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func viewWillAppear(animated: Bool) {
		// checkNeedShowGuideViewController()
	}

	override func viewDidAppear(animated: Bool) {
		checkNeedShowGuideViewController()
	}
	/*
	 // MARK: - Navigation

	 // In a storyboard-based application, you will often want to do a little preparation before navigation
	 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
	 // Get the new view controller using segue.destinationViewController.
	 // Pass the selected object to the new view controller.
	 }
	 */

	override func prefersStatusBarHidden() -> Bool {
		return true
	}

	@IBAction func unwindFromGuideViewController(sender: UIStoryboardSegue) {
		isNeesGuide = false
		setNeedShowGuide(isNeesGuide)
	}

//	// 登录按钮
//	@IBAction func onLoginTappend() {
//		let loginVC = R.storyboard.main.navigationLogin()!
//		presentViewController(loginVC, animated: true, completion: nil)
//	}
//
//	// 注册按钮
//	@IBAction func onRegisterTappend() {
//		let registerVC = R.storyboard.main.navigationRegister()!
//		presentViewController(registerVC, animated: true, completion: nil)
//	}
}

//MARK: 扩展, 是否需要显示引页面
extension LauncherViewController {

	func showGuideViewController() {
		if let vc = R.storyboard.main.guideStoryboardID() {
			vc.modalTransitionStyle = .FlipHorizontal
			presentViewController(vc, animated: true, completion: nil)
		}
	}

	// MARK: 检查是否需要显示的引导页面
	func checkNeedShowGuideViewController() {
		if let guideBean = ArchiverUtils.loadData(ArchiverPath.NeedGuidePath) as? NeedGuideBean {
			isNeesGuide = guideBean.needGuide
		} else {
			isNeesGuide = true
		}

		if isNeesGuide {
			showGuideViewController()
		} else {
			UIView.animateWithDuration(0.3) {
//				self.stackView.hidden = false
				self.stackView.alpha = 1
			}

//			UIView.beginAnimations(nil, context: nil)
//			UIView.setAnimationDuration(0.3)
//            self.stackView.hidden = false
//			UIView.commitAnimations()

		}
	}

	// MARK: 设置是否需要显示引导页面
	func setNeedShowGuide(need: Bool) {
		let bean = NeedGuideBean(needGuide: need)
		ArchiverUtils.saveData(bean, path: ArchiverPath.NeedGuidePath)
	}

}
