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
            
                let parking1: ParkingDeck = parkingDict[self.firstClosest!]!
                let parking2: ParkingDeck = parkingDict[self.secondClosest!]!
                self.selectDeck(parking1: parking1, parking2: parking2)
            
                self.deckLabel.text = self.parkingDeck
                self.progressBar.progress = self.percentage ?? 0
                self.percentLabel.text = self.percentageAsString
        }
        
    }
    
    //choose the better deck
    func selectDeck(parking1: ParkingDeck, parking2: ParkingDeck) {

        if(parking1.percent > parking2.percent) {
            self.parkingDeck = parking1.name
            self.percentage = Float(parking1.percent * 100)
            self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "%"
        } else {
            self.parkingDeck = parking2.name
            self.percentage = Float(parking2.percent * 100)
            self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "%"
        }
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
