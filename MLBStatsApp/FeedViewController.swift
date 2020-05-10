//
//  FeedViewController.swift
//  MLBStatsApp
//
//  Created by Quentin-Allen Velayo Fernandez on 4/12/20.
//  Copyright © 2020 Quentin-Fernandez-Maryann-Cortez. All rights reserved.
//

import UIKit
import Parse

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var players = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let query = PFQuery(className:"Players")
        query.includeKey("objectID")
        query.limit = 20
        
        query.findObjectsInBackground{(players, error) in
            if players != nil {
                self.players = players!
                self.tableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayerCell") as! PlayerCell
        
        let player = players[indexPath.row]
        
        cell.firstNameLabel.text = player["firstName"] as? String
        cell.lastNameLabel.text = player["lastName"] as? String
        cell.positionLabel.text = player["Position"] as? String
        return cell
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let player = players[indexPath.row] 
        
        let statsViewController = segue.destination as! StatsViewController
        statsViewController.player = player
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
