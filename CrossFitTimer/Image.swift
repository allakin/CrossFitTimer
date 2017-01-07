//
//  Image.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 07/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import Foundation
import UIKit

extension UIImage {
	open class func	startTimer() -> UIImage {
		return UIImage(named: "start_timer.png")!
	}
	
	class func stopTimer() -> UIImage {
		return UIImage(named: "stop_timer.png")!
	}
	
	class func removeAllTimer() -> UIImage {
		return UIImage(named: "remove_all.png")!
	}
	
	class func newLapsTimer() -> UIImage {
		return UIImage(named: "new_laps.png")!
	}
	
}
