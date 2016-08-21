//
//  GuidePageViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class GuidePageViewController: UIPageViewController {

	var guide1VC: UIViewController!
	var guide2VC: UIViewController!
	var guide3VC: UIViewController!
	var guide4VC: UIViewController!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		initAllViewController()

		// navigationOrientation = .Horizontal //方向
		// transitionStyle = .Scroll //过渡效果
		dataSource = self
		delegate = self

		setViewControllers([guide1VC], direction: .Forward, animated: true, completion: nil)

		view.backgroundColor = UIColor.whiteColor()
        
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

}

//MARK: 初始化所有引导页面
extension GuidePageViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
	func initAllViewController() {
		guide1VC = storyboard?.instantiateViewControllerWithIdentifier("Guide1ID")
		guide2VC = storyboard?.instantiateViewControllerWithIdentifier("Guide2ID")
		guide3VC = storyboard?.instantiateViewControllerWithIdentifier("Guide3ID")
		guide4VC = storyboard?.instantiateViewControllerWithIdentifier("Guide4ID")
	}

	func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
		print("1")
		switch viewController.title! {
		case "guide1":
			return guide2VC
		case "guide2":
			return guide3VC
		case "guide3":
			return guide4VC
		case "guide4":
			return nil
		default:
			return nil
		}
	}
	func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
		print("2")

		switch viewController.title! {
		case "guide1":
			return nil
		case "guide2":
			return guide1VC
		case "guide3":
			return guide2VC
		case "guide4":
			return guide3VC
		default:
			return nil
		}
	}

//	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//		print("3")
//		return 4
//	}
//
//	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//		print("4")
//		return 3
//	}

	func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		print("5 \(finished) \(previousViewControllers.first?.title) \(completed)")
	}

	func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
		print("6 \(pendingViewControllers.first?.title)")
	}
}

