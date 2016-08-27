//
//  GCD.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/27.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import Foundation

class GCD {
	// MARK: 创建一个并行队列
	static let concurrent_queue = dispatch_queue_create("concurrent_queue", DISPATCH_QUEUE_CONCURRENT)

	// MARK: 主线程队列,特殊的串行队列
	static let main_queue = dispatch_get_main_queue()

	// MARK: 并行队列,同步执行任务
	class func onBackSync(block: () -> ()) {
		dispatch_sync(concurrent_queue, block)
	}

	// MARK: 并行队列,异步执行任务
	class func onBackAsync(block: () -> ()) {
		dispatch_async(concurrent_queue, block)
	}

	// MARK: 主线程,同步调用,会阻塞当前线程...并且当主线程全部任务都执行完成后,才会执行...
	class func onMainSync(block: () -> ()) {
		dispatch_sync(main_queue, block)
	}

	// MARK: 主线程,异步调用, 不阻塞当前线程.
	class func onMainAsync(block: () -> ()) {
		dispatch_async(main_queue, block)
	}
}
