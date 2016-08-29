//
//  LoginViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/28.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

	@IBOutlet weak var userNameOutlet: UITextField!
	@IBOutlet weak var passwordOutlet: UITextField!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.

		navigationController?.navigationBar.show()
		navigationController?.navigationBar.removeBGView()
		navigationItem.setTitleTextAndColor(UIColor.whiteColor(), title: "登录")

		userNameOutlet.setValue(UIColor.whiteColor(), forKeyPath: "placeholderLabel.textColor")
		passwordOutlet.setValue(UIColor.whiteColor(), forKeyPath: "placeholderLabel.textColor")

		userNameOutlet.delegate = self
		passwordOutlet.delegate = self
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

	override func prefersStatusBarHidden() -> Bool {
		return false
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		userNameOutlet.resignFirstResponder()
		passwordOutlet.resignFirstResponder()
	}

	@IBAction func onLoginTappend(sender: AnyObject) {
//		JHProgressHUD.sharedHUD.showInWindow()
		JHProgressHUD.sharedHUD.showInWindow(withHeader: nil, andFooter: "登录中...")
		GCD.afterDelay(1) {
			JHProgressHUD.sharedHUD.hide()
		}
	}

	@IBAction func onForgetTappend(sender: AnyObject) {
//		HUD.show(HUDContentType.Progress)
//		HUD.show(HUDContentType.Success)
//		HUD.flash(HUDContentType.Success, delay: 2)
//		HUD.flash(HUDContentType.Progress)
		HUD.flash(HUDContentType.Error)
		noticeTop("忘记密码了吗?", backgroundColor: UIColor.redColor())
	}

	func addHUD() {
		let label = UILabel()
		label.text = "HUD...Test"
		label.textColor = UIColor.whiteColor()
		label.sizeToFit()
		// label.backgroundColor = UIColor.greenColor()
		label.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
		label.layer.cornerRadius = 10
		label.layer.borderWidth = 2
		label.layer.borderColor = UIColor.blueColor().CGColor
		// label.layer.backgroundColor = UIColor.greenColor().CGColor
		app.window?.addSubview(label)
	}
}

extension LoginViewController: UITextFieldDelegate {
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}
}
