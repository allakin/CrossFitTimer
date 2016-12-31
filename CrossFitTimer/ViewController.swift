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

	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func startStopButton(_ sender: Any) {
	}
	@IBAction func lapRefreshButton(_ sender: Any) {
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

