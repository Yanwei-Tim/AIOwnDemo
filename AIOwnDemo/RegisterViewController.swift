//
//  RegisterViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/28.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class RegisterViewController: BaseEditFieldViewController {

	@IBOutlet weak var phoneNumberOutlet: UITextField_AutoSize!
	@IBOutlet weak var passwordOutlet: UITextField_AutoSize!
	@IBOutlet weak var passwordRepeatOutlet: UITextField_AutoSize!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		navigationController?.navigationBar.show()
		navigationController?.navigationBar.removeBGView()
		navigationItem.setTitleColor(UIColor.whiteColor())

		phoneNumberOutlet.returnKeyType = .Next
		passwordOutlet.returnKeyType = .Next
		passwordRepeatOutlet.returnKeyType = .Done

		phoneNumberOutlet.keyboardType = .NumberPad

		passwordOutlet.secureTextEntry = true
		passwordRepeatOutlet.secureTextEntry = true

		phoneNumberOutlet.delegate = self
		passwordOutlet.delegate = self
		passwordRepeatOutlet.delegate = self

		translationHeight = 40
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

	// MARK:下一步
	override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
		if identifier == R.segue.registerViewController.registerNext.identifier {
			if phoneNumberOutlet.isTextEmpty() || passwordOutlet.isTextEmpty() || passwordRepeatOutlet.isTextEmpty() {
				showAlertView(title: "提示", message: "请检查输入信息!")
				return false
			}
		}

		return true
	}
}

extension RegisterViewController {
	func textFieldDidBeginEditing(textField: UITextField) {
		if textField === passwordRepeatOutlet {
			translationViewTop()
		}
	}

	func textFieldShouldReturn(textField: UITextField) -> Bool {
		if textField == phoneNumberOutlet {
			passwordOutlet.becomeFirstResponder()
		} else if textField == passwordOutlet {
			passwordRepeatOutlet.becomeFirstResponder()
		} else {
			textField.resignFirstResponder()
		}
		return true
	}

	func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		// 显示文本输入框能输入的最大字符数
		if let textLenght = textField.text?.endIndex.toInt() where textField == phoneNumberOutlet {
			let appendLenght = string.endIndex.toInt()
			if textLenght - range.length + appendLenght > 11 {
				return false
			}
		}
		return true
	}
}