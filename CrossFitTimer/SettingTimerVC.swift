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
		time.min = Int(minutesTextField.text!)!
		time.sec = Int(secindTextField.text!)!
		print(time.min)
		print(time.sec)
	}
	
}
