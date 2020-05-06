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
    
    //Bar Charts
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var avgBarChart: BarChartView!
    @IBOutlet weak var homeRunBarChart: BarChartView!
    @IBOutlet weak var rbiBarChart: BarChartView!
    @IBOutlet weak var winsBarChart: BarChartView!
    @IBOutlet weak var eraBarChart: BarChartView!
    @IBOutlet weak var strikeoutBarChart: BarChartView!
    
    
    //Hits
    var currentEntry = BarChartDataEntry(x: 1, y: 365)
    var otherPlayers = BarChartDataEntry(x: 2, y: 323)
    
    //Average
    var avgEntry = BarChartDataEntry(x: 1, y: 0.250)
    var avgOthers = BarChartDataEntry(x:2, y: 0.250)
    
    //HomeRuns
    var playerHomeRuns = BarChartDataEntry(x: 1, y: 50)
    var othersHomeRuns = BarChartDataEntry(x: 2, y: 50)
    
    //Runs Batted In
    var playerRBI = BarChartDataEntry(x: 1, y: 50)
    var othersRBI = BarChartDataEntry(x:2, y: 50)
    
    //Wins
    var playerWins = BarChartDataEntry(x: 1, y: 50)
    var otherWins = BarChartDataEntry(x: 2, y: 50)
    
    //Earned Run Average
    var playerERA = BarChartDataEntry(x: 1, y: 3.00)
    var otherERA = BarChartDataEntry(x: 2, y: 3.00)
    
    //StrikeOuts
    var playerStrikeOuts = BarChartDataEntry(x: 1, y: 200)
    var otherStrikeOuts = BarChartDataEntry(x: 2, y: 200)
    
    //Entrys
    var numberOfHits = [BarChartDataEntry]()
    var battingAVGNumber = [BarChartDataEntry]()
    var numberOfHomeRuns = [BarChartDataEntry]()
    var numberOfRBIs = [BarChartDataEntry]()
    var numberOfWins = [BarChartDataEntry]()
    var eraNumber = [BarChartDataEntry]()
    var strikeoutNumber = [BarChartDataEntry]()
    
    //Labels
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var positionNameLabel: UILabel!
    @IBOutlet weak var hitsLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var battingAverageLabel: UILabel!
    @IBOutlet weak var homeRunLabel: UILabel!
    @IBOutlet weak var rbiLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var eraLabel: UILabel!
    @IBOutlet weak var strikeoutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //hitBarChart.delegate = self
        
        //Calculations
        let hits = player["Hits"]
        let atBats = (player["atBats"] as? Double)!
        let battingAverage = (hits as! Double / atBats)
        let roundedBA = Double(round(1000*battingAverage)/1000)
        let inningsPitched = (player["inningsPitched"] as? Double)!
        let runsAllowed = (player["runsAllowed"] as? Double)!
        let era = ((runsAllowed*9)/inningsPitched)
        let roundedEra = Double(round(100000*era/1000)/100)
        
        //Labels
        firstNameLabel.text = player["firstName"] as? String
        lastNameLabel.text = player["lastName"] as? String
        teamNameLabel.text = player["Team"] as? String
        positionNameLabel.text = player["Position"] as? String
        hitsLabel.text = "\(hits ?? Int.self)"
        battingAverageLabel.text = "\(roundedBA)"
        homeRunLabel.text = "\(player["homeRuns"] ?? Int.self)"
        rbiLabel.text = "\(player["RBI"] ?? Int.self)"
        winsLabel.text = "\(player["Wins"] ?? Int.self)"
        eraLabel.text = "\(roundedEra)"
        strikeoutLabel.text = "\(player["strikeouts"] ?? Int.self)"
        
        
        //BarChart Stuff
        currentEntry = BarChartDataEntry(x: 1, y: hits as! Double)
        avgEntry = BarChartDataEntry(x: 1, y: roundedBA)
        playerHomeRuns = BarChartDataEntry(x: 1, y: player["homeRuns"] as! Double)
        playerRBI = BarChartDataEntry(x: 1, y: player["RBI"] as! Double)
        playerWins = BarChartDataEntry(x: 1, y: player["Wins"] as! Double)
        playerERA = BarChartDataEntry(x: 1, y: roundedEra)
        playerStrikeOuts = BarChartDataEntry(x: 1, y: player["strikeouts"] as! Double)
        
        numberOfHits = [currentEntry, otherPlayers]
        battingAVGNumber = [avgEntry, avgOthers]
        numberOfHomeRuns = [playerHomeRuns, othersHomeRuns]
        numberOfRBIs = [playerRBI, othersRBI]
        numberOfWins = [playerWins, otherWins]
        eraNumber = [playerERA, otherERA]
        strikeoutNumber = [playerStrikeOuts, otherStrikeOuts]
        
        updateHitChart()
        updateAvgChart()
        updateHomeRunChart()
        updateRBIChart()
        updateWinsChart()
        updateERAChart()
        updateStrikeoutChart()
    }
    
    func updateHitChart() {
        
        let chartDataSet = BarChartDataSet(entries: numberOfHits, label:nil)
        let chartData = BarChartData(dataSet: chartDataSet)
        chartDataSet.colors = ChartColorTemplates.liberty()
        
        barChart.data = chartData
    }
    
    func updateAvgChart() {
        let avgchartDataSet = BarChartDataSet(entries: battingAVGNumber, label:nil)
        let chartData = BarChartData(dataSet: avgchartDataSet)
        avgchartDataSet.colors = ChartColorTemplates.joyful()
        
        avgBarChart.data = chartData
    }
    
    func updateHomeRunChart(){
        let homeRunDataSet = BarChartDataSet(entries: numberOfHomeRuns, label:nil)
        let chartData = BarChartData(dataSet: homeRunDataSet)
        homeRunDataSet.colors = ChartColorTemplates.colorful()
        
        homeRunBarChart.data = chartData
    }
    
    func updateRBIChart(){
        let rbiDataSet = BarChartDataSet(entries: numberOfRBIs, label: nil)
        let chartData = BarChartData(dataSet: rbiDataSet)
        rbiDataSet.colors = ChartColorTemplates.material()
        
        rbiBarChart.data = chartData
    }
    
    func updateWinsChart(){
        let winsDataSet = BarChartDataSet(entries: numberOfWins, label: nil)
        let chartData = BarChartData(dataSet: winsDataSet)
        winsDataSet.colors = ChartColorTemplates.pastel()
        
        winsBarChart.data = chartData
    }
    
    func updateERAChart(){
        let eraDataSet = BarChartDataSet(entries: eraNumber, label: nil)
        let chartData = BarChartData(dataSet: eraDataSet)
        eraDataSet.colors = ChartColorTemplates.colorful()
        
        eraBarChart.data = chartData
    }
    
    func updateStrikeoutChart(){
        let strikeoutDataSet = BarChartDataSet(entries: strikeoutNumber, label: nil)
        let chartData = BarChartData(dataSet: strikeoutDataSet)
        strikeoutDataSet.colors = ChartColorTemplates.liberty()
        
        strikeoutBarChart.data = chartData
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
        let updatePlayer = player
        let updateStatsViewController = segue.destination as! UpdateStatsViewController
        updateStatsViewController.updatePlayer = updatePlayer
        
    }
    
}
