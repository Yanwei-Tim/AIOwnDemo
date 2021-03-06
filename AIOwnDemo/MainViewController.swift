//
//  ViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/20.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func viewWillAppear(animated: Bool) {
		hideNavigationBar()
		print("main:\(#function)")
	}

	override func viewDidAppear(animated: Bool) {
		print("main:\(#function)")
	}

	override func viewDidDisappear(animated: Bool) {
		print("main:\(#function)")
	}

	override func viewWillDisappear(animated: Bool) {
		print("main:\(#function)")
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	@IBAction func onDismiss(sender: AnyObject) {
		dismissViewControllerAnimated(true, completion: nil)
	}
}

