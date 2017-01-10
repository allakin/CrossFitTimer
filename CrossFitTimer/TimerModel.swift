//
//  TimerModel.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 07/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import Foundation
import UIKit

class TimerModel {
	var minutes: Int
	var seconds: Int
	var fractions: Int
	var startStopWatch: Bool
	var addLap: Bool
	var stopWatchString: String
	var round: Int
	
	init() {
		minutes = 0
		seconds = 0
		fractions = 0
		startStopWatch = true
		addLap = false
		stopWatchString = ""
		round = 1
	}
	
}

//class TimeTimer {
//	var min: Int {
//		get {
//			return min
//		}
//		set {
//			if newValue > 0 {
//				min = newValue
//				print(min)
//			}
//		}
//	}
//	var sec: Int = 0
//}

class TimeTimer {
	var min = 0
	var sec = 13
}

//
//class TimeTimer {
//	var min = 0
//	var _min: Int {
//		get {
//			return min
//			print("\(min)-get min")
//		}
//		set {
//			if newValue > 0 {
//				min = newValue
//				print("\(min)-min")
//			}
//		}
//	}
//	
//	var sec = 0
//	var _sec: Int {
//		get {
//			return sec
//			print("\(sec)-get sec")
//		}
//		set {
//			if newValue > 0 {
//				sec = newValue
//				print("\(sec)-sec")
//			}
//		}
//	}
//	
//}
