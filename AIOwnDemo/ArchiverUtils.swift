//
//  ArchiverUtils.swift
//  AIOwnDemo
//
//  Created by angcyo on 16/08/21.
//  Copyright © 2016年 angcyo. All rights reserved.
//

import UIKit

struct ArchiverUtils {

	// MARK: 保存数据对象到指定的文件
	static func saveData(object: AnyObject, path: String) -> Bool {
		return NSKeyedArchiver.archiveRootObject(object, toFile: path)
	}

	// MARK: 从指定的文件读取数据对象
	static func loadData(path: String) -> AnyObject? {
		return NSKeyedUnarchiver.unarchiveObjectWithFile(path)
	}
}

extension ArchiverUtils {
	static var baseDocPath: NSURL {
		let fileManager = NSFileManager.defaultManager()
		let path = fileManager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		if fileManager.fileExistsAtPath(path.path!) {
			return path
		}
		try! fileManager.createDirectoryAtPath(path.path!, withIntermediateDirectories: true, attributes: nil)
		return path
	}

	// MARK: 给定文件名, 返回文件的全路径
	static func getPath(fileName: String) -> String {
		return baseDocPath.URLByAppendingPathComponent(fileName).path!
	}
}