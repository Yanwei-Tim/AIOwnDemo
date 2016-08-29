//
//  NSThraedEx.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/27.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import Foundation

extension NSThread {

	// MARK: 子线程调用
	class func onBack(block: () -> ()) {
		NSOperationQueue().addOperationWithBlock(block)
	}

	// MARK:主线程调用
	class func onMain(block: () -> ()) {
		NSOperationQueue.mainQueue().addOperationWithBlock(block)
	}

	// MARK: 延时调用
	class func afterDelay(delayTime: Double, completion: () -> Void) {
		NSOperationQueue().addOperationWithBlock {
			NSThread.sleepForTimeInterval(delayTime)
			completion()
		}
	}
}

