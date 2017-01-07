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
	var lapsTime: [String] = []
	var timer = Timer()
	var minutes: Int = 0
	var seconds: Int = 0
	var fractions: Int = 0
	var startStopWatch: Bool = true
	var addLap: Bool = false
	var stopWatchString: String = ""
	var round: Int = 1
	
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
	
	//MARK: - startStopButton
	
	@IBAction func startStopButton(_ sender: Any) {
		
		if startStopWatch == true {
			player.play()
			timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopWatch), userInfo: nil, repeats: true)
			startStopWatch = false
			startStopButton.setImage(UIImage(named: "stop_timer.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			lapResetButton.setImage(UIImage(named: "new_laps.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			addLap = true
			navigationController!.navigationBar.barTintColor = UIColor.greenTextColor
			green()
		} else {
			player.stop()
			startStopWatch = true
			addLap = false
			timer.invalidate()
			startStopButton.setImage(UIImage(named: "start_timer.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			lapResetButton.setImage(UIImage(named: "remove_all.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			navigationController!.navigationBar.barTintColor = UIColor.redTextColor
			red()
		}
	}
	//end startStopButton
	
	//MARK: - lapRefreshButton
	
	@IBAction func lapRefreshButton(_ sender: Any) {
		fractions = 0
		seconds = 0
		minutes = 0
		player.stop()
		player.currentTime = 0
		player.play()
		if addLap == true {
			lapsTime.insert(stopWatchString, at: 0)
			round += 1
			raundLabel.text = "Раунд: \(round)/8"
		} else {
			player.stop()
			player.currentTime = 0
			addLap = false
			lapResetButton.setImage(UIImage(named: "new_laps.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			startStopButton.setImage(UIImage(named: "start_timer.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			stopWatchString = "00:00:00"
			raundLabel.text = "Раунд: 0/8"
			subTittleLabel.text = "Тренировка"
			stopWatchLabel.text = stopWatchString
			lapsTime.removeAll()
			navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
			yellow()
		}
		
		delegate?.lapsTimeDidChange(lapsTime: lapsTime)
		
	}
	//end lapRefreshButton
	
	//MARK: - func updateStopWatch
	func updateStopWatch() {
		fractions += 1
		if fractions == 100 {
			seconds += 1
			fractions = 0
		} else if seconds == 60 {
			minutes += 1
			seconds = 0
		} else if seconds == 60 {
			minutes += 1
			seconds = 0
		} else if minutes == 3 && seconds == 18{
			player.stop()
			player.currentTime = 0
			player.play()
			fractions = 0
			seconds = 0
			minutes = 0
			round += 1
			lapsTime.insert(stopWatchString, at: 0)
			delegate?.lapsTimeDidChange(lapsTime: lapsTime)
			raundLabel.text = "Раунд: \(round)/8"
		} else if round == 9 {
			player.stop()
			player.currentTime = 0
			startStopWatch = true
			raundLabel.text = "Раунд: 8/8"
			subTittleLabel.text = "Тренировка завершенна"
			fractions = 0
			seconds = 0
			minutes = 0
			round = 1
			timer.invalidate()
			yellow()
			lapsTime.removeAll()
			startStopButton.setImage(UIImage(named: "start_timer.png")?.withRenderingMode(.alwaysOriginal), for: .normal)
			navigationController!.navigationBar.barTintColor = UIColor.yellowTextColor
			alertController()
		}
		
		let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
		let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
		let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
		
		stopWatchString = "\(minutesString):\(secondString):\(fractionsString)"
		stopWatchLabel.text = stopWatchString
		
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

