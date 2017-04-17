//
//  ViewController.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 31/12/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

/// простенький протокол, который будет отвечать за делегирование
protocol ViewControllerDelegate: NSObjectProtocol {
	func lapsTimeDidChange(lapsTime: [String])
}

class ViewController: UIViewController {
	
	weak var delegate: ViewControllerDelegate?
	
	@IBOutlet weak var stopWatchLabel: UILabel!
	@IBOutlet weak var startStopButton: UIButton!
	@IBOutlet weak var lapResetButton: UIButton!
	@IBOutlet weak var raundLabel: UILabel!
	@IBOutlet weak var subTittleLabel: UILabel!

	var player: AVAudioPlayer!
	var lapsTVC: LapsTVC!
	var timer = Timer()
	var model = TimerModel()
	var lapsTime: [String] = []
	var minutes: Int = 0
	var seconds: Int = 0
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		stopWatchLabel.text = "00:00:00"
		
		yellow()
		// Change the navigation bar background color to blue.
		navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
		
		//Указал путь к аудио файлу
		do {
			let audioPath = Bundle.main.path(forResource: "play_round", ofType: "mp3")
			try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
		}	catch {
			//Error
		}
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func returnTimerScreen(segue: UIStoryboardSegue) {
	}
	
	//MARK: - startStopButton
	
	@IBAction func startStopButton(_ sender: Any) {
		
		if stopWatchLabel.text == "00:00:00" {
			let alert = UIAlertController(title: "Ошибка", message: "Вы не установили время таймера", preferredStyle: .alert)
			let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
			alert.addAction(okAction)
			present(alert, animated: true, completion: nil)
			model.startStopWatch = false
		}
		
		if model.startStopWatch == true {
			player.play()
			timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopWatch), userInfo: nil, repeats: true)
			model.startStopWatch = false
			startStopButton.setImage(UIImage.stopTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			lapResetButton.setImage(UIImage.newLapsTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			model.addLap = true
			navigationController!.navigationBar.barTintColor = UIColor.greenTextColor
			//subTittleLabel.text = "Тренировка"
			green()
		} else {
			player.stop()
			model.startStopWatch = true
			model.addLap = false
			timer.invalidate()
			startStopButton.setImage(UIImage.startTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			lapResetButton.setImage(UIImage.removeAllTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			navigationController!.navigationBar.barTintColor = UIColor.redTextColor
			red()
		}
	}
	//end startStopButton
	
	//MARK: - lapRefreshButton
	
	@IBAction func lapRefreshButton(_ sender: Any) {
		model.fractions = 0
		model.seconds = 0
		model.minutes = 0
		player.stop()
		player.currentTime = 0
		player.play()
		if model.addLap == true {
			lapsTime.insert(model.stopWatchString, at: 0)
			model.round += 1
			raundLabel.text = "Раунд: \(model.round)/8"
		} else {
			player.stop()
			player.currentTime = 0
			model.addLap = false
			lapResetButton.setImage(UIImage.newLapsTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			startStopButton.setImage(UIImage.startTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			model.stopWatchString = "00:00:00"
			raundLabel.text = "Раунд: 0/8"
			subTittleLabel.text = "Тренировка"
			stopWatchLabel.text = model.stopWatchString
			lapsTime.removeAll()
			navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
			yellow()
		}
		
		delegate?.lapsTimeDidChange(lapsTime: lapsTime)
		
	}
	//end lapRefreshButton
	
	//MARK: - func updateStopWatch
	func updateStopWatch() {
		model.fractions += 1
		if model.fractions == 100 {
			model.seconds += 1
			model.fractions = 0
		} else if model.seconds == 60 {
			model.minutes += 1
			model.seconds = 0
		} else if model.seconds == 60 {
			model.minutes += 1
			model.seconds = 0
		} else if model.minutes == minutes && model.seconds == seconds{
			print("\(minutes)-viewcontroller <------------------")
			print("\(seconds)-viewcontroller <------------------")
			player.stop()
			player.currentTime = 0
			player.play()
			model.fractions = 0
			model.seconds = 0
			model.minutes = 0
			model.round += 1
			lapsTime.insert(model.stopWatchString, at: 0)
			delegate?.lapsTimeDidChange(lapsTime: lapsTime)
			raundLabel.text = "Раунд: \(model.round)/8"
		} else if model.round == 9 {
			player.stop()
			player.currentTime = 0
			model.startStopWatch = true
			raundLabel.text = "Раунд: 8/8"
			subTittleLabel.text = "Тренировка завершенна"
			model.fractions = 0
			model.seconds = 0
			model.minutes = 0
			model.round = 1
			timer.invalidate()
			yellow()
			lapsTime.removeAll()
			startStopButton.setImage(UIImage.startTimer().withRenderingMode(.alwaysOriginal), for: .normal)
			navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
			alertController()
		}
		
		let fractionsString = model.fractions > 9 ? "\(model.fractions)" : "0\(model.fractions)"
		let secondString = model.seconds > 9 ? "\(model.seconds)" : "0\(model.seconds)"
		let minutesString = model.minutes > 9 ? "\(model.minutes)" : "0\(model.minutes)"
		
		model.stopWatchString = "\(minutesString):\(secondString):\(fractionsString)"
		stopWatchLabel.text = model.stopWatchString
		
	}
	//end func updateStopWatch
	
	//MARK: - Color
	func yellow(){
		view.backgroundColor = UIColor.yellowBGColor
		stopWatchLabel.textColor = UIColor.yellowTextColor
	}
	func green(){
		view.backgroundColor = UIColor.greenBGColor
		stopWatchLabel.textColor = UIColor.greenTextColor
	}
	func red(){
		view.backgroundColor = UIColor.redBGColor
		stopWatchLabel.textColor = UIColor.redTextColor
	}
	//end Color
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "tableViewInformation" {
			lapsTVC = segue.destination as! LapsTVC
			lapsTVC.viewController = self
		}
	}
	
}

