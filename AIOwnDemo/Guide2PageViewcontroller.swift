//
//  Guide2PageViewcontrollerViewController.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

class Guide2PageViewcontroller: UIViewController {

	var guide1VC: UIViewController!
	var guide2VC: UIViewController!
	var guide3VC: UIViewController!
	var guide4VC: UIViewController!

	@IBOutlet weak var pageControl: UIPageControl!

	var pageViewController: UIPageViewController!

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
		initAllViewController()
		for viewController in childViewControllers {
			if viewController.title == "PagerController" {
				pageViewController = viewController as! UIPageViewController
				pageViewController.dataSource = self
				pageViewController.delegate = self
				pageViewController.setViewControllers([guide1VC], direction: .Reverse, animated: false, completion: nil)
				break
			}
		}

		pageControl.numberOfPages = 4
		pageControl.currentPage = 0
		pageControl.currentPageIndicatorTintColor = UIColor(red: 0.00, green: 0.75, blue: 1.00, alpha: 1.00)

		view.backgroundColor = UIColor(red: 0.13, green: 0.15, blue: 0.17, alpha: 1.00)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: 返回状态栏的样式
	override func preferredStatusBarStyle() -> UIStatusBarStyle {
		return .LightContent
	}

	// MARK: 隐藏状态栏
	override func prefersStatusBarHidden() -> Bool {
		return true
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
extension Guide2PageViewcontroller: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
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

	// MARK: 这个方法会自动决定UIPageControl的numberOfPages属性.
	// MARK:自动的意思就是:不需要任何代码, 只要界面中有UIPageControl, 那么UIPageControl就会自动工作, UIPageViewController切换的时候,自动会跟着切换....苹果牛逼啊
//	func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
//		return 4
//	}
////
////	// MARK: 这个方法自动决定UIPageControl的currentPage属性
//	func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
//		return 0
//	}

	func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
		print("5 \(finished) \(previousViewControllers.first?.title) \(completed)")
//		pageControl.currentPage = getCurrentPageIndexFromTitle(previousViewControllers.first!.title!)

		if completed {
			pageControl.currentPage = getCurrentPageIndexFromTitle(pageViewController.viewControllers!.first!.title!)
		}
	}

	func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {
		print("6 \(pendingViewControllers.first?.title)")
	}

	func getCurrentPageIndexFromTitle(title: String) -> Int {
		switch title {
		case "guide1":
			return 0
		case "guide2":
			return 1
		case "guide3":
			return 2
		case "guide4":
			return 3
		default:
			return 0
		}
	}
}
