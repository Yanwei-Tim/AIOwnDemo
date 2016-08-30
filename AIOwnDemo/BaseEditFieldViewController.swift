//
//  BaseEditFieldViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class BaseEditFieldViewController: UIViewController {

	var isTransation: Bool = false
	// MARK: 键盘显示时,平移的高度
	var translationHeight: CGFloat = 100

	var allTextField = [UITextField]()

	override func viewDidLoad() {
		initAllTextField(self.view)
//		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onKeyboardShow), name: UIKeyboardWillShowNotification, object: nil)
//		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onKeyboardHide), name: UIKeyboardWillHideNotification, object: nil)
		NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(onKeyboardHide), name: UIKeyboardDidHideNotification, object: nil)
	}

	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		hideKeyboard()
	}
}

extension BaseEditFieldViewController: UITextFieldDelegate {
	// MARK: 限制textField最大的字符数
	func textFieldMaxLength(maxLength: Int, textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
		// 显示文本输入框能输入的最大字符数
		if let textLenght = textField.text?.endIndex.toInt() {
			let appendLenght = string.endIndex.toInt()
			if textLenght - range.length + appendLenght > maxLength {
				return false
			}
		}
		return true
	}
}

extension BaseEditFieldViewController {

	// MARK: 隐藏键盘
	func hideKeyboard() {
		for textField in allTextField {
			textField.resignFirstResponder()
		}
	}

	internal func initAllTextField(view: UIView) {
		for subView in view.subviews {
			if subView.isKindOfClass(UITextField) {
				let textField = subView as! UITextField
				allTextField.append(textField)
			} else {
				initAllTextField(subView)
			}
		}
	}

	// MARK:键盘隐藏的通知回调
	func onKeyboardHide(notify: NSNotification) {
		translationViewBotton()
	}

	// MARK:键盘显示的通知回调
	func onKeyboardShow(notify: NSNotification) {

	}

	// 从notify里面,获取键盘的高度
	func getKeyboardHeight(notify notify: NSNotification) -> CGFloat {
		let value = notify.userInfo![UIKeyboardFrameBeginUserInfoKey] as? NSValue

		guard let keyboardRect = value?.CGRectValue() else {
			return -1
		}

		return keyboardRect.height
	}

	// MARK:视图向下平移
	func translationViewBotton() {
		if !isTransation { return }

		var view: UIView
		if let parentViewController = parentViewController {
			view = parentViewController.view
		} else {
			view = self.view
		}

		UIView.animateWithDuration(0.3) {
			view.center.y = screenHeight / 2
		}

		isTransation = false
	}

	// MARK: 视图向上平移
	func translationViewTop() {
		if isTransation { return }

		var view: UIView
		if let parentViewController = parentViewController {
			view = parentViewController.view
		} else {
			view = self.view
		}

		UIView.animateWithDuration(0.3) {
			view.center.y = screenHeight / 2 - self.translationHeight
		}

		isTransation = true
	}

}
