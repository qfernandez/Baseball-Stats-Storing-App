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
    
    @IBOutlet weak var barChart: BarChartView!
    @IBOutlet weak var avgBarChart: BarChartView!
    
    
    //Hits
    var currentEntry = BarChartDataEntry(x: 1, y: 365)
    var otherPlayers = BarChartDataEntry(x: 2, y: 323)
    
    //Average
    var avgEntry = BarChartDataEntry(x: 1, y: 0.250)
    var avgOthers = BarChartDataEntry(x:2, y: 0.250)
    
    var numberOfHits = [BarChartDataEntry]()
    var battingAVGNumber = [BarChartDataEntry]()
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBOutlet weak var positionNameLabel: UILabel!
    @IBOutlet weak var hitsLabel: UILabel!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var battingAverageLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        hitBarChart.delegate = self
        
        let hits = player["Hits"]
        let atBats = (player["atBats"] as? Double)!
        let battingAverage = (hits as! Double / atBats)
        let roundedBA = Double(round(1000*battingAverage)/1000)
            
        firstNameLabel.text = player["firstName"] as? String
        lastNameLabel.text = player["lastName"] as? String
        teamNameLabel.text = player["Team"] as? String
        positionNameLabel.text = player["Position"] as? String
        hitsLabel.text = "\(hits ?? Int.self)"
        battingAverageLabel.text = "\(roundedBA)"
        currentEntry = BarChartDataEntry(x: 1, y: hits as! Double)
        avgEntry = BarChartDataEntry(x: 1, y: roundedBA)
        
        numberOfHits = [currentEntry, otherPlayers]
        battingAVGNumber = [avgEntry, avgOthers]
        
        updateHitChart()
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
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//
//        hitBarChart.frame = CGRect(x: 0, y:0, width: self.view.frame.size.width,height: self.view.frame.size.height)
//        hitBarChart.center = view.center
//        view.addSubview(hitBarChart)
//
//        let set = BarChartDataSet(entries: [
//            BarChartDataEntry(x: 1, y:0),
//            BarChartDataEntry(x: 2, y:0),
//            BarChartDataEntry(x: 3, y:0),
//            BarChartDataEntry(x: 4, y:0),
//            BarChartDataEntry(x: 5, y:2),
//            BarChartDataEntry(x: 6, y:323),
//            BarChartDataEntry(x: 7, y:365),
//            BarChartDataEntry(x: 8, y:783),
//            BarChartDataEntry(x: 9, y:957),
//            BarChartDataEntry(x: 10, y:1380),
//            BarChartDataEntry(x: 11, y:1786),
//        ])
//
//        set.colors = ChartColorTemplates.liberty()
//
//        let data = BarChartData(dataSet: set)
//
//        hitBarChart.data = data
//    }
    
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
