//
//  DashboardTableViewController.swift
//  CheckbookMobileapp
//
//  Created by Varun on 2/23/19.
//  Copyright © 2019 Varun Tandon. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DashboardTableViewController: UITableViewController {
    var json_response: JSON = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer b2vssr6S6ymQD9akd46MzVPbHCvTAK",
        ]
        AF.request("https://sandbox.checkbook.io/v3/check", headers: headers).responseJSON { response in
            if let result = response.result.value {
                let json = JSON(result)
                self.json_response = json
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.json_response["checks"].count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CheckCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? UICheckCellTableViewCell else {
            fatalError("not an instance of CheckCell")
        }
        
        let check = json_response["checks"][indexPath.row]
        cell.checkNumberLabel.text = check["number"].string
        cell.checkStatusLabel.text = check["status"].string
        cell.checkAmountLabel.text = "$" + (check["amount"].number?.stringValue)!
        cell.checkDateLabel.text = check["date"].string
        let wasSent = (check["direction"].stringValue == "OUTGOING")
        cell.directionLabel.text = wasSent ? "Sent" : "Recieved"
        cell.otherPartyLabel.text = wasSent ? check["recipient"].stringValue : check["sender"].stringValue
        return cell
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
