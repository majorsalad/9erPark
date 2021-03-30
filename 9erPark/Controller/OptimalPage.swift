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
                    self.firstClosest = "CD VS"
                    self.secondClosest = "WEST"
                case "Barnard":
                    //East Deck 1 (F/S), 2/3(student), cone deck(F/S)
                   //Next closest student is probably union
                    self.firstClosest = "ED2/3"
                    self.secondClosest = "UDU"
                case "Colvard":
                    //Cone deck  1/2(F/S), east deck 1(F/S), 2/3, west deck(student)
                    self.firstClosest="ED2/3"
                    self.secondClosest = "WEST"
                case "Denny":
                    //East deck 1(F/S), 2/3(Student), cone deck 1/2(F/S)
                    //next closest is union or west (about .8 miles)
                    self.firstClosest = "ED2/3"
                    self.secondClosest = "WEST"
                case "Fretwell":
                    //East deck 1(F/S) 2/3, cone deck 1/2
                    //next closest union, west, or south village (.8 miles)
                    self.firstClosest="ED2/3"
                    self.secondClosest = "WEST"
                case "Woodward":
                    //West deck, union(Student), cone 2, 1, south village (student)
                    self.firstClosest="WEST"
                    self.secondClosest = "SOUTH"
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
