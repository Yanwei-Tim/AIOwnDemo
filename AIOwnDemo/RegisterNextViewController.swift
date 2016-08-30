//
//  RegisterNextViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RegisterNextViewController: BaseEditFieldViewController {

	@IBOutlet weak var confirmOutlet: UIButton_AutoSize!
	@IBOutlet weak var countDownOutlet: UILabel_AutoSize!
	@IBOutlet weak var authCodeOutlet: UITextField_AutoSize!

	// 倒计时,当前执行了多少秒
	var countDown = 0

	var nsTimer: NSTimer!

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.setTitleTextAndColor(UIColor.whiteColor(), title: "注册")
		authCodeOutlet.delegate = self
		authCodeOutlet.keyboardType = .ASCIICapable
	}

	override func viewDidAppear(animated: Bool) {
		startCountDown()
	}

	override func didReceiveMemoryWarning() {
		print("\(#function)")
	}

	override func viewWillDisappear(animated: Bool) {
		print("\(#function)")
	}

	override func viewDidDisappear(animated: Bool) {
		print("\(#function)")
		cancelCountDown()
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	@IBAction func onConfirmTappend(sender: AnyObject) {
		if isCountDownEnd() {
			startCountDown()
			countDown = 0
			countDownOutlet.text = "60秒后重新发送验证码"
			confirmOutlet.setTitle("确 定", forState: .Normal)
		} else {
			// 确定状态
			if authCodeOutlet.isTextEmpty() {
				showAlertView(title: "提示", message: "请输入验证码")
			} else {
				noticeTop("注册成功")
			}
		}
	}
}

extension RegisterNextViewController {
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return true
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		return textFieldMaxLength(4, textField: textField, shouldChangeCharactersInRange: range, replacementString: string)
	}

	// 开始倒计时
	func startCountDown() {
		cancelCountDown()
		nsTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(onTime), userInfo: nil, repeats: true)
	}

	// 取消倒计时
	func cancelCountDown() {
		if nsTimer != nil {
			nsTimer.invalidate()
			nsTimer = nil
		}
	}

	func onTime() {
		countDown += 1
		// 1分钟后,取消倒计时
		if isCountDownEnd() {
			cancelCountDown()
			countDownOutlet.text = "请重新发送验证码!"
//			confirmOutlet.titleLabel?.text = "重新发送"
			confirmOutlet.setTitle("重新发送", forState: .Normal)
		} else {
			countDownOutlet.text = "\(60-countDown)秒后重新发送验证码"
		}

		print(" \(NSThread.isMainThread()) \(countDown)")
	}

	func isCountDownEnd() -> Bool {
		return countDown >= 60
	}
}