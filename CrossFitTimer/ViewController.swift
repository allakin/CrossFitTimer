//
//  ViewController.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 31/12/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	@IBOutlet weak var stopWatchLabel: UILabel!
	@IBOutlet weak var lapsTableView: UITableView!
	@IBOutlet weak var startStopButton: UIBarButtonItem!
	@IBOutlet weak var lapResetButton: UIBarButtonItem!
	@IBOutlet weak var raundLabel: UILabel!
	@IBOutlet weak var subTittleLabel: UILabel!
	
	var laps: [String] = []
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
		lapResetButton.isEnabled = false
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	//MARK: - startStopButton
	@IBAction func startStopButton(_ sender: Any) {
		
		if startStopWatch == true {
			timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopWatch), userInfo: nil, repeats: true)
			startStopWatch = false
			startStopButton.image = UIImage(named: "close.png")
			lapResetButton.image = UIImage(named: "timers1.png")
			addLap = true
			lapResetButton.isEnabled = true
			laps.removeAll()
			green()
		} else {
			startStopWatch = true
			addLap = false
			timer.invalidate()
			lapResetButton.isEnabled = true
			startStopButton.image = UIImage(named: "play.png")
			lapResetButton.image = UIImage(named: "timers.png")
			red()
		}
	}
	//end startStopButton
	
	//MARK: - lapRefreshButton
	@IBAction func lapRefreshButton(_ sender: Any) {
		if addLap == true {
			laps.insert(stopWatchString, at: 0)
			fractions = 0
			seconds = 0
			minutes = 0
			round += 1
			raundLabel.text = "Раунд: \(round)/8"
			lapsTableView.reloadData()
		} else {
			addLap = false
			lapResetButton.image = UIImage(named: "timers1.png")
			laps.removeAll()
			lapsTableView.reloadData()
			fractions = 0
			seconds = 0
			minutes = 0
			stopWatchString = "00:00:00"
			lapResetButton.isEnabled = false
			stopWatchLabel.text = stopWatchString
			yellow()
		}
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
		} else if minutes == 0 && seconds == 10{
			fractions = 0
			seconds = 0
			minutes = 0
			round += 1
			laps.insert(stopWatchString, at: 0)
			lapsTableView.reloadData()
			raundLabel.text = "Раунд: \(round)/8"
		} else if round == 9 {
			raundLabel.text = "Раунд: 8/8"
			subTittleLabel.text = "Тренировка завершенна"
			fractions = 0
			seconds = 0
			minutes = 0
			round = 1
			timer.invalidate()
			yellow()
			lapResetButton.isEnabled = false
			startStopButton.image = UIImage(named: "play.png")
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
		lapsTableView.backgroundColor = UIColor.yellowBGColor
		lapsTableView.separatorColor = UIColor.yellowTextColor
	}
	func green(){
		view.backgroundColor = UIColor.greenBGColor
		stopWatchLabel.textColor = UIColor.greenTextColor
		lapsTableView.backgroundColor = UIColor.greenBGColor
		lapsTableView.separatorColor = UIColor.greenTextColor
	}
	
	func red(){
		view.backgroundColor = UIColor.redBGColor
		stopWatchLabel.textColor = UIColor.redTextColor
		lapsTableView.backgroundColor = UIColor.redBGColor
		lapsTableView.separatorColor = UIColor.redTextColor
	}
	//end Color
	
	//MARK: - Alert
	func alertController() {
		let alert = UIAlertController(title: "Поздравляю", message: "Тренировка законченна", preferredStyle: .alert)
		let actionButton = UIAlertAction(title: "Я справился!", style: .default, handler: nil)
		alert.addAction(actionButton)
		present(alert, animated: true, completion: nil)
	}
	//end Alert
	
	//MARK: - Table View Methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return laps.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
		cell.textLabel?.text = "Время \(laps.count - indexPath.row) раунда"
		cell.detailTextLabel?.text = laps[indexPath.row]
		return cell
	}
	//end Table View Methods
	
}

