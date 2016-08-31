//
//  UserInfoViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/31.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
	@IBOutlet weak var userBgOutlet: UIImageView!
	@IBOutlet weak var tableViewOutlet: UITableView!

	override func viewDidLoad() {
		showNavigationBar()
		removeNavigationBarBackground()

		userBgOutlet.userInteractionEnabled = true

		initTableView(tableViewOutlet)
	}

	override func viewDidAppear(animated: Bool) {
//		print("")
//		for view in (navigationController?.navigationBar.subviews)! {
//			view.removeFromSuperview()
//		}
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}
	@IBAction func onUserBgTouch(sender: AnyObject) {
		print("onTouch")
		R.reuseIdentifier.baseCell
	}
}

//实现列表TableView
extension UserInfoViewController: UITableViewDelegate, UITableViewDataSource {
	func initTableView(tableView: UITableView) {
		tableView.delegate = self
		tableView.dataSource = self
	}

//	func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//		return 50
//	}

	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		print("section:\(section)")
		return tableDataSource.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let row = indexPath.row
		let (image, title, tel) = tableDataSource[row]
		if row == 0 {
			let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.telCell.identifier)! as! TelViewCell
			cell.imageOutlet .image = image
			cell.titleOutlet.text = title
			cell.telOutlet.text = tel
			return cell
		} else {
			let cell = tableView.dequeueReusableCellWithIdentifier(R.reuseIdentifier.baseCell.identifier)! as! BaseViewCell
			cell.imageOutlet .image = image
			cell.titleOutlet.text = title
			cell.backImageOutlet.image = R.image.btn_user_blue_multset_nor()!
			return cell
		}
	}
}

//静态数据源
private var tableDataSource: [(UIImage, String, String?)] = [
	(R.image.user_icon_user1()!, "账号", "13800138000"),
	(R.image.user_icon_password()!, "密码", nil),
	(R.image.user_icon_hand()!, "手势密码", nil),
	(R.image.user_icon_matching()!, "设备匹配", nil),
	(R.image.user_icon_ca()!, "证件认证", nil),
	(R.image.user_icon_ca()!, "保险认证", nil),
	(R.image.user_icon_feedback()!, "用户反馈", nil)
]