//
//  LoginViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet weak var stackView: UIStackView!

	var isNeesGuide: Bool = true

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		// checkNeedShowGuideViewController()
//		stackView.hidden = true
		isNeesGuide = true

		stackView.alpha = 0
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
	}
}

//MARK: 扩展, 是否需要显示引页面
extension LoginViewController {

	func showGuideViewController() {
		if let vc = storyboard?.instantiateViewControllerWithIdentifier(StoryboardID.guideViewController) {
			vc.modalTransitionStyle = .FlipHorizontal
			presentViewController(vc, animated: true, completion: nil)
		}
	}

	func checkNeedShowGuideViewController() {
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

}
