//
//  AddPlayerViewController.swift
//  MLBStatsApp
//
//  Created by Quentin-Allen Velayo Fernandez on 4/19/20.
//  Copyright © 2020 Quentin-Fernandez-Maryann-Cortez. All rights reserved.
//

import UIKit
import Parse

class AddPlayerViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var teamName: UITextField!
    @IBOutlet weak var positionName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onSubmitButton(_ sender: Any) {
        let player = PFObject(className: "Players")
            
            player["firstName"] = firstName.text!
            player["lastName"] = lastName.text!
            player["Team"] = teamName.text!
            player["Position"] = positionName.text!
            
            player.saveInBackground { (success, error) -> Void in
             if success {
                self.dismiss(animated: true, completion: nil)
                print("Saved in server")
            } else {
                print("error!")
            }
            
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
