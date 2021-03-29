//
//  OptimalPage.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class OptimalPage : UIViewController, ParkingManagerDelegate {
    
    var buildingName : String?
    var parkingManager = ParkingManager()
    var parkingDeck : String?
    var percentage : Float?
    var percentageAsString : String?
    var firstClosest : String?
    var secondClosest : String?
    
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var deckLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    
    override func viewDidLoad() {
        buildingLabel.text = buildingName
        parkingManager.delegate = self
        parkingManager.performRequest()
    }
    
    func didUpdateParking(_ parkingManager: ParkingManager, parkingDict: Dictionary<String, ParkingDeck>) {
        DispatchQueue.main.async {
            switch self.buildingName {
                case "Atkins":
                    print(parkingDict["CD VS"]!)
                    self.firstClosest = "CD VS"
                    self.secondClosest = "WEST"
                    
                    if(parkingDict[self.firstClosest!]!.percent > parkingDict[self.secondClosest!]!.percent){
                        self.parkingDeck = parkingDict["CD VS"]?.name
                        self.percentage = Float(parkingDict["CD VS"]!.percent * 100)
                        self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "%"
                    } else {
                        self.parkingDeck = parkingDict["WEST"]?.name
                        self.percentage = Float(parkingDict["WEST"]!.percent * 100)
                        self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "%"
                    }
                    
                case "Barnard":
                    print(parkingDict["WEST"]!)
                case "Colvard":
                    print(parkingDict["WEST"]!)
                case "Denny":
                    print(parkingDict["CD VS"]!)
                case "Fretwell":
                    print(parkingDict["CD VS"]!)
                case "Woodward":
                    print(parkingDict["CD VS"]!)
                default:
                    print(parkingDict["CD VS"]!)
                }
                
                self.deckLabel.text = self.parkingDeck
                self.progressBar.progress = self.percentage ?? 0
                self.percentLabel.text = self.percentageAsString
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
