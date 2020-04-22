//
//  PlayerGalleryViewController.swift
//  MLBStatsApp
//
//  Created by Quentin-Allen Velayo Fernandez on 4/12/20.
//  Copyright © 2020 Quentin-Fernandez-Maryann-Cortez. All rights reserved.
//

//import UIKit
//import Parse
//
//class PlayerGalleryViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource{
//    
//    //Why doesn't it want to work
//    @IBOutlet weak var tableView: UITableView!
//    
//    var players = [PFObject]()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        let query = PFQuery(className:"Players")
//        query.includeKey("firstName")
//        
//        query.findObjectsInBackground { (players, error) in
//            if players != nil {
//                self.players = players!
//                self.tableView.reloadData()
//            }
//        }
//        
//    }
//    
//    // MARK: - Table view data source
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return players.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =  tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerCell
//        
//        let player = players[indexPath.row]
//        
//        _ = player["firstName"] as! PFUser
//        
//        cell.firstNameLabel.text = (player["firstName"] as! String)
//        cell.lastNameLabel.text = (player["lastName"] as! String)
//        
//        return cell
//    }
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }
//
//    /*
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
//
//        // Configure the cell...
//
//        return cell
//    }
//    */
//
//    /*
//    // Override to support conditional editing of the table view.
//    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the specified item to be editable.
//        return true
//    }
//    */
//
//    /*
//    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }    
//    }
//    */
//
//    /*
//    // Override to support rearranging the table view.
//    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
//
//    }
//    */
//
//    /*
//    // Override to support conditional rearranging of the table view.
//    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        // Return false if you do not want the item to be re-orderable.
//        return true
//    }
//    */
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
