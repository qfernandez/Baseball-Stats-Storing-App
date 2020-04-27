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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateFNLabel.text = updatePlayer["firstName"] as? String
        updateLNLabel.text = updatePlayer["lastName"] as? String
        positionLabel.text = updatePlayer["Position"] as? String
        
        //Object Id is updatePlayer["ObjectId"]
        
    }
    
    @IBAction func updateButton(_ sender: Any) {
        
        //For Hits
        let hits: Int? = Int(hitsLabel.text!)
        let a = updatePlayer["Hits"] as? Int
        let b = a! + hits!
        updatePlayer["Hits"] = b
        
        //For Other Stats
        
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
