//
//  StatsViewController.swift
//  MLBStatsApp
//
//  Created by Quentin-Allen Velayo Fernandez on 4/21/20.
//  Copyright © 2020 Quentin-Fernandez-Maryann-Cortez. All rights reserved.
//

import UIKit
import Parse
import Charts

class StatsViewController: UIViewController, ChartViewDelegate {
    
    var player: PFObject!
    var hitBarChart = BarChartView()
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var positionNameLabel: UILabel!
    @IBOutlet weak var hitsLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    
    var name = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hitBarChart.delegate = self
        
        let a = player["Hits"]
        
        firstNameLabel.text = player["firstName"] as? String
        lastNameLabel.text = player["lastName"] as? String
        teamNameLabel.text = player["Team"] as? String
        positionNameLabel.text = player["Position"] as? String
        hitsLabel.text = "\(a ?? Int.self)"
        //print(player["Hits"] ?? Int())
        
    }
    
    @IBAction func alertButton(_ sender: Any) {
        let alert = UIAlertController(title: "Hello", message: "Are you sure you wish to delete player?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (action) in
                    print("cancel")
                }))
                alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler:{ (action) in
                    print("deleted")
                    self.player.deleteInBackground()
                }))
                self.present(alert, animated: true)
    }
    //MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let button = sender as! UIButton
        let updatePlayer = player
        
        let updateStatsViewController = segue.destination as! UpdateStatsViewController
        updateStatsViewController.updatePlayer = updatePlayer
        //let button = sender as! UIButton
        
    }
    
}
