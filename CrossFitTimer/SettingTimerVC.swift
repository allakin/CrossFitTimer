//
//  SettingTimer.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 07/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import UIKit

class SettingTimerVC: UIViewController {
	
	@IBOutlet weak var minutesTextField: UITextField!
	@IBOutlet weak var secindTextField: UITextField!
	
	var time = TimeTimer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		minutesTextField.text = ""
	 secindTextField.text = ""
		// Do any additional setup after loading the view.
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func saveSetting(_ sender: Any) {
		time.min = Int(self.minutesTextField.text!)!
		time.sec = Int(self.secindTextField.text!)!
//		print(time.min)
//		print(time.sec)
//		print(minutesTextField.text!)
//		print(secindTextField.text!)
//		time._min = Int(minutesTextField.text!)!
//		time._sec = Int(secindTextField.text!)!
//		time.min = 1
//		time.sec = 12
//		var textFieldValue: Int {
//			get {
//				return Int(minutesTextField.text!)!
//			}
//			set {
//				textFieldValue = time.min
//				time.min = Int(newValue)
//				print(time.min)
//			}
//		}
//		
//		var textFieldValueSecond: Int {
//			get {
//				return Int(secindTextField.text!)!
//			}
//			set {
//				textFieldValueSecond = time.sec
//				time.sec = Int(newValue)
//			}
//		}
		
	}
	
}
