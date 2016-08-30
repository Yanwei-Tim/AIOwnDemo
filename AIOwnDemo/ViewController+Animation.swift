//
//  ViewController+Animation.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/30.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

//MARK:动画基类
class BaseAnimation: NSObject, UIViewControllerAnimatedTransitioning {

	var containerView: UIView? = nil
	var toVC: UIViewController? = nil
	var fromVC: UIViewController? = nil

	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		containerView = transitionContext.containerView()
		toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
		fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)

		if let to = toVC, from = fromVC, container = containerView {
			onAnimation(toView: to.view, fromView: from.view, containerView: container, transitionContext: transitionContext)
		}
	}
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return 0.3
	}
	func onAnimation(toView toView: UIView, fromView: UIView, containerView: UIView, transitionContext: UIViewControllerContextTransitioning) {

	}
}

//MARK: 标准的从右向左的动画
class BaseTransitionAnimation: BaseAnimation {
	override func onAnimation(toView toView: UIView, fromView: UIView, containerView: UIView, transitionContext: UIViewControllerContextTransitioning) {
		containerView.insertSubview(toView, aboveSubview: fromView)
		toView.center.x = screenWidth * 3 / 2
		fromView.center.x = screenWidth / 2
		UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
			toView.center.x = screenWidth / 2
			fromView.center.x = screenWidth / 4
			}, completion: { completion in
			transitionContext.completeTransition(true)
			}
		)
	}
}

//MARK: 标准的从左向右的动画
class BaseDismissTransitionAnimation: BaseAnimation {
	override func onAnimation(toView toView: UIView, fromView: UIView, containerView: UIView, transitionContext: UIViewControllerContextTransitioning) {
		containerView.insertSubview(toView, belowSubview: fromView)
		toView.center.x = 0
		fromView.center.x = screenWidth / 2
		UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
			toView.center.x = screenWidth / 2
			fromView.center.x = screenWidth * 3 / 2
			}, completion: { completion in
			transitionContext.completeTransition(true)
			}
		)
	}
}

//MARK: Present动画
class CustomPresentAnimation: NSObject, UIViewControllerAnimatedTransitioning {

	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//		transitionContext.containerView()?.backgroundColor = UIColor.whiteColor() // 修改过渡时的背景颜色

		let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
		let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

		transitionContext.containerView()?.insertSubview(toViewController.view, belowSubview: fromViewController.view)

		// 1:
		toViewController.view.transform = CGAffineTransformMakeTranslation(0, screenHeight)
		UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
			toViewController.view.transform = CGAffineTransformIdentity
			fromViewController.view.transform = CGAffineTransformMakeTranslation(0, -screenHeight)
		}) { (completion) in
			fromViewController.view.transform = CGAffineTransformIdentity
			transitionContext.completeTransition(completion)
		}

		// 2:
		// toViewController.view.frame.offsetInPlace(dx: 0, dy: height)
		// UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
		// toViewController.view.frame.offsetInPlace(dx: 0, dy: -height)
		// fromViewController.view.frame.offsetInPlace(dx: 0, dy: -height)
		// }) { completion in
		// fromViewController.view.frame.offsetInPlace(dx: 0, dy: height)
		// transitionContext.completeTransition(completion)
		// }

		// 3:
		// toViewController.view.center.y = 3 * height / 2
		// UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
		// toViewController.view.center.y = height / 2
		// fromViewController.view.center.y = -height / 2
		// }) { completion in
		// transitionContext.completeTransition(completion)
		// }
	}
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return 0.3
	}
}

//MARK: Dismiss动画
class CustomDismissAnimation: NSObject, UIViewControllerAnimatedTransitioning {

	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
//		transitionContext.containerView()?.backgroundColor = UIColor.whiteColor() // 修改过渡时的背景颜色

		let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
		let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

		transitionContext.containerView()?.insertSubview(toViewController.view, belowSubview: fromViewController.view)

		// 1:
		toViewController.view.transform = CGAffineTransformMakeTranslation(0, -screenHeight)
		UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
			toViewController.view.transform = CGAffineTransformIdentity
			fromViewController.view.transform = CGAffineTransformMakeTranslation(0, screenHeight)
		}) { (completion) in
			fromViewController.view.transform = CGAffineTransformIdentity
			transitionContext.completeTransition(completion)
		}

		// 2:
		// toViewController.view.frame.offsetInPlace(dx: 0, dy: -height)
		// UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
		// toViewController.view.frame.offsetInPlace(dx: 0, dy: height)
		// fromViewController.view.frame.offsetInPlace(dx: 0, dy: height)
		// }) { completion in
		// fromViewController.view.frame.offsetInPlace(dx: 0, dy: -height)
		// transitionContext.completeTransition(completion)
		// }

		// 3:
		// toViewController.view.center.y = -height / 2
		// UIView.animateWithDuration(transitionDuration(transitionContext), animations: {
		// toViewController.view.center.y = height / 2
		// fromViewController.view.center.y = 3 * height / 2
		// }) { completion in
		// transitionContext.completeTransition(completion)
		// }
	}
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return 0.3
	}
}

//MARK: Push 动画
class CustomPushAnimation: NSObject, UIViewControllerAnimatedTransitioning {
	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		print("\(#function)")

		transitionContext.containerView()?.backgroundColor = UIColor.whiteColor() // 修改过渡时的背景颜色

		let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
		let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

		transitionContext.containerView()?.insertSubview(toViewController.view, aboveSubview: fromViewController.view)

		toViewController.view.transform = CGAffineTransformMakeTranslation(screenWidth, screenHeight)
		// 通过以下方式,可以组合2个动画效果
		// toViewController.view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-100, -100), CGAffineTransformMakeScale(2, 2))
		UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
			toViewController.view.transform = CGAffineTransformIdentity
			fromViewController.view.transform = CGAffineTransformMakeTranslation(-screenWidth, -screenHeight)
		}) { (completion) in
			fromViewController.view.transform = CGAffineTransformIdentity
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
		}
	}
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return 0.3
	}
}

//MARK: Pop动画
class CustomPopAnimation: NSObject, UIViewControllerAnimatedTransitioning {

	func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
		transitionContext.containerView()?.backgroundColor = UIColor.whiteColor() // 修改过渡时的背景颜色

		let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
		let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!

		transitionContext.containerView()?.insertSubview(toViewController.view, belowSubview: fromViewController.view)

		toViewController.view.transform = CGAffineTransformMakeTranslation(-screenWidth, -screenHeight)
		UIView.animateWithDuration(self.transitionDuration(transitionContext), animations: {
			toViewController.view.transform = CGAffineTransformIdentity
			fromViewController.view.transform = CGAffineTransformMakeTranslation(screenWidth, screenHeight)
		}) { (completion) in
			fromViewController.view.transform = CGAffineTransformIdentity
			transitionContext.completeTransition(!transitionContext.transitionWasCancelled())
		}
	}
	func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
		return 0.3
	}
}
