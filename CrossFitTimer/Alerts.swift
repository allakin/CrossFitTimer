//
//  Alerts.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 04/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	func alertController() {
		let alert = UIAlertController(title: "Поздравляю", message: "Тренировка законченна", preferredStyle: .alert)
		let actionButton = UIAlertAction(title: "Я справился!", style: .default, handler: nil)
		alert.addAction(actionButton)
		present(alert, animated: true, completion: nil)
	}
}
