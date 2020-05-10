//
//  UpdateStatsViewController.swift
//  MLBStatsApp
//
//  Created by Quentin-Allen Velayo Fernandez on 4/27/20.
//  Copyright © 2020 Quentin-Fernandez-Maryann-Cortez. All rights reserved.
//

import UIKit
import Parse

class UpdateStatsViewController: UIViewController {

    var updatePlayer: PFObject!
    
    @IBOutlet weak var updateFNLabel: UILabel!
    @IBOutlet weak var updateLNLabel: UILabel!
    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var hitsLabel: UITextField!
    @IBOutlet weak var atBatsLabel: UITextField!
    @IBOutlet weak var homeRunLabel: UITextField!
    @IBOutlet weak var rbiLabel: UITextField!
    @IBOutlet weak var winsLabel: UITextField!
    @IBOutlet weak var ipLabel: UITextField!
    @IBOutlet weak var runsAllowedLabel: UITextField!
    @IBOutlet weak var strikeoutLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFNLabel.text = updatePlayer["firstName"] as? String
        updateLNLabel.text = updatePlayer["lastName"] as? String
        positionLabel.text = updatePlayer["Position"] as? String
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        //For Hits
        let hits: Int? = Int(hitsLabel.text!)
        let initialHits = updatePlayer["Hits"] as? Int
        let newHits = initialHits! + hits!
        updatePlayer["Hits"] = newHits
        
        //For atBats
        let atBats: Int? = Int(atBatsLabel.text!)
        let initialAB = updatePlayer["atBats"] as? Int
        let newAB = initialAB! + atBats!
        updatePlayer["atBats"] = newAB
        
        //For Homeruns
        let homeruns: Int? = Int(homeRunLabel.text!)
        let initialHRs = updatePlayer["homeRuns"] as? Int
        let newHRs = initialHRs! + homeruns!
        updatePlayer["homeRuns"] = newHRs
        
        //For RBIs
        let rbis: Int? = Int(rbiLabel.text!)
        let initialRBIs = updatePlayer["RBI"] as? Int
        let newRBIs = initialRBIs! + rbis!
        updatePlayer["RBI"] = newRBIs
        
        //For Wins
        let wins: Int? = Int(winsLabel.text!)
        let initialWins = updatePlayer["Wins"] as? Int
        let newWins = initialWins! + wins!
        updatePlayer["Wins"] = newWins
        
        //For Innings Pitched
        let ip: Int? = Int(ipLabel.text!)
        let initialIP = updatePlayer["inningsPitched"] as? Int
        let newIP = initialIP! + ip!
        updatePlayer["inningsPitched"] = newIP
        
        //For Runs Allowed
        let runsAllowed: Int? = Int(runsAllowedLabel.text!)
        let initialRAs = updatePlayer["runsAllowed"] as? Int
        let newRAs = initialRAs! + runsAllowed!
        updatePlayer["runsAllowed"] = newRAs
        
        //For Strikeouts Allowed
        let strikeouts: Int? = Int(strikeoutLabel.text!)
        let initialSOs = updatePlayer["strikeouts"] as? Int
        let newSOs = initialSOs! + strikeouts!
        updatePlayer["strikeouts"] = newSOs
        
        //This just used for letting you know if it went through
        updatePlayer.saveInBackground { (success, error) -> Void in
         if success {
            self.dismiss(animated: true, completion: nil)
            print("Saved in server")
        } else {
            print("error!")
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    }

}
