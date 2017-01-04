//
//  LapsTVC.swift
//  CrossFitTimer
//
//  Created by Павел Анплеенко on 03/01/17.
//  Copyright © 2017 Pavel Anpleenko. All rights reserved.
//

import UIKit

class LapsTVC: UITableViewController, ViewControllerDelegate {
	
	@IBOutlet var lapsTable: UITableView!
	
	var viewController: ViewController? {
		didSet {
			/// каждый раз, когда в viewController будет присваиватся какое-то значение, будет выполнятся то, что мы пишем в didSet
			/// в данном случае этот код выполнится один раз
			viewController?.delegate = self
		}
	}
	
	var lapsRound: [String] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		lapsTable.backgroundColor = UIColor.whiteTransperent
		lapsTable.separatorColor = UIColor.white
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Table view data source
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return lapsRound.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "cell")
		cell.textLabel?.text = "Время \(lapsRound.count - indexPath.row) раунда"
		cell.detailTextLabel?.text = lapsRound[indexPath.row]
		return cell
	}
	
	///метод делегата ViewControllerDelegate, получаем данные из ViewController и обновляем таблицу
	func lapsTimeDidChange(lapsTime: [String]) {
		lapsRound = lapsTime
		lapsTable.reloadData()
	}
}
