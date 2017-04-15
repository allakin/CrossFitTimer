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
