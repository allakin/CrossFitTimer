//
//  ViewController.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 31/12/16.
//  Copyright © 2016 Pavel Anpleenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var stopWatchLabel: UILabel!
	@IBOutlet weak var lapsTableView: UITableView!
	@IBOutlet weak var startStopButton: UIBarButtonItem!
	@IBOutlet weak var lapResetButton: UIBarButtonItem!

	var timer = Timer()
	var minutes: Int = 0
	var seconds: Int = 0
	var fractions: Int = 0
	var startStopWatch: Bool = true
	var addLap: Bool = false
	var stopWatchString: String = ""
	
	override func viewDidLoad() {
		super.viewDidLoad()
		stopWatchLabel.text = "00:00:00"
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func startStopButton(_ sender: Any) {
		
		if startStopWatch == true {
			timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateStopWatch), userInfo: nil, repeats: true)
			startStopWatch = false
			startStopButton.image = UIImage(named: "close.png")
			addLap = true
		} else {
			startStopWatch = true
			timer.invalidate()
			startStopButton.image = UIImage(named: "play.png")
		}
		
	}
	@IBAction func lapRefreshButton(_ sender: Any) {
	}

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
		}
	
		let fractionsString = fractions > 9 ? "\(fractions)" : "0\(fractions)"
		let secondString = seconds > 9 ? "\(seconds)" : "0\(seconds)"
		let minutesString = minutes > 9 ? "\(minutes)" : "0\(minutes)"
		
		stopWatchString = "\(minutesString):\(secondString):\(fractionsString)"
		stopWatchLabel.text = stopWatchString
		
	}
	
	//MARK: - Table View Methods
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	return 3
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
		cell.textLabel?.text = "Lap"
		cell.detailTextLabel?.text = "00:00:00"
		return cell
	}
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
}

