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
	@IBOutlet weak var secondsTextField: UITextField!
	
	var minutes: String = "0"
	var seconds: String = "1"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBAction func saveTimePressed(_ sender: Any) {
		
		var error = ""
		
		if (minutesTextField.text?.isEmpty)!{
			error = "минут"
		} else if (secondsTextField.text?.isEmpty)!{
			error = "секунд"
		}
		
		
		if (minutesTextField.text?.characters.count)! > 2 {
			error = "минут"
		} else if (secondsTextField.text?.characters.count)! > 2{
			error = "секунд"
		} else if Int(minutesTextField.text!)! >= 61 {
			error = "минут"
		} else if Int(secondsTextField.text!)! >= 61 {
			error = "секунд"
		}
		
		if error != "" {
			let alert = UIAlertController(title: "Ошибка", message: "Вы не указали количество \(error)", preferredStyle: .alert)
			let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alert.addAction(okAction)
			present(alert, animated: true, completion: nil)
		} else {
			minutes = minutesTextField.text!
			seconds = secondsTextField.text!
		 performSegue(withIdentifier: "returnToTimer", sender: self)
			
			print(minutes)
			print(seconds)
			
		}
	}
	
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "returnToTimer"{
			let settingDestiation = segue.destination as! ViewController
			settingDestiation.minutes = Int(minutes)!
			settingDestiation.seconds = Int(seconds)!
			settingDestiation.subTittleLabel.text = "Время круга: \(minutes):\(seconds):00"
			settingDestiation.stopWatchLabel.text = "\(minutes):\(seconds):00"
		}
	}

	
	
}
