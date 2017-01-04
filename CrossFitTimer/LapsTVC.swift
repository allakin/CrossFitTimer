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
	
	/*
		// Override to support conditional editing of the table view.
		override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the specified item to be editable.
		return true
		}
		*/
	
	/*
		// Override to support editing the table view.
		override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if editingStyle == .delete {
		// Delete the row from the data source
		tableView.deleteRows(at: [indexPath], with: .fade)
		} else if editingStyle == .insert {
		// Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
		}
		}
		*/
	
	/*
		// Override to support rearranging the table view.
		override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
		
		}
		*/
	
	/*
		// Override to support conditional rearranging of the table view.
		override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		// Return false if you do not want the item to be re-orderable.
		return true
		}
		*/
	
	/*
		// MARK: - Navigation
		
		// In a storyboard-based application, you will often want to do a little preparation before navigation
		override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		// Get the new view controller using segue.destinationViewController.
		// Pass the selected object to the new view controller.
		}
		*/
	
}
