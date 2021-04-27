//
//  OptimalPage.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class OptimalPage : UIViewController, ParkingManagerDelegate {
    var minCap = 0.4 //If a deck is less than 70% available, recommend its neighbor
    
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
    @IBOutlet weak var deckProgressBar: NSLayoutConstraint!
    @IBOutlet weak var buildingImage: UIImageView!
    
    
    override func viewDidLoad() {
        buildingLabel.text = buildingName
        parkingManager.delegate = self
        parkingManager.performRequest()
    }
    
    func didUpdateParking(_ parkingManager: ParkingManager, parkingDict: Dictionary<String, ParkingDeck>) {
        DispatchQueue.main.async {
            switch self.buildingName {
            case "Athletic Storage":
                self.firstClosest = "WEST"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Atkins":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "atkins-building")
            case "Auxiliary Services Building":
                self.firstClosest = "ED2/3"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "aux-building")
            case "Barnard":
                //East Deck 1 (F/S), 2/3(student), cone deck(F/S)
               //Next closest student is probably union
                self.firstClosest = "ED2/3"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Barnhardt Student Activity Center":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Baseball Indool Training Facility":
                self.firstClosest = "WEST"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Belk Gymnasium":
                self.firstClosest = "WEST"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Belk Hall":
                self.firstClosest = "UDU"
                self.secondClosest = "NORTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "BES Recycling Facility":
                self.firstClosest = "NORTH"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Bioinformatics":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Bissell House":
                self.firstClosest = "SOUTH"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Burson":
                self.firstClosest = "UDU"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cafeteria Activities Building":
                self.firstClosest = "ED2/3"
                self.secondClosest = "NORTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cameron Hall":
                self.firstClosest = "UDU"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Carriage House":
                self.firstClosest = "SOUTH"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cato College of Education":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cato Hall":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cedar":
                self.firstClosest = "NORTH"
                self.secondClosest = "ED2/3"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Center City Building": //NOT CORRECT!
                self.firstClosest = "NORTH"
                self.secondClosest = "ED2/3"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "College of Health & Human Services":
                self.firstClosest = "UDU"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Colvard":
                //Cone deck  1/2(F/S), east deck 1(F/S), 2/3, west deck(student)
                self.firstClosest="ED2/3"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Cone University Center":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Denny":
                //East deck 1(F/S), 2/3(Student), cone deck 1/2(F/S)
                //next closest is union or west (about .8 miles)
                self.firstClosest = "ED2/3"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Duke Centennial Hall":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Early College High School":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "EHS Storage Shed":
                self.firstClosest = "NORTH"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Elm":
                self.firstClosest = "UDU"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "EPIC":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Facilities Annex 3 Greenhouse":
                self.firstClosest = "NORTH"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Fretwell":
                //East deck 1(F/S) 2/3, cone deck 1/2
                //next closest union, west, or south village (.8 miles)
                self.firstClosest="ED2/3"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Friday":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Gage Undergraduate Admissions Center":
                self.firstClosest = "SOUTH"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Grigg":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Halton Wagner Tennix Complex":
                self.firstClosest = "WEST"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Harris Alumni Center":
                self.firstClosest = "SOUTH"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Hawthorne":
                self.firstClosest = "NORTH"
                self.secondClosest = "ED2/3"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Hickory":
                self.firstClosest = "ED2/3"
                self.secondClosest = "NORTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Hunt Hall":
                self.firstClosest = "SOUTH"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Jerry Richardson Stadium":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Johnson Band Center":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Judy W. Rose Football Center":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Kennedy":
                self.firstClosest = "CD VS"
                self.secondClosest = "ED2/3"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "King":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Kulwicki Motorsports Laboratory":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "McEniry":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Memorial Hall":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Miltimore Hall":
                self.firstClosest = "UDU"
                self.secondClosest = "NORTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Miltimore-Wallis Center":
                self.firstClosest = "WEST"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Motorsports Research":
                self.firstClosest = "UDU"
                self.secondClosest = "NORTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Popp Martin Student Union":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "PORTAL":
                self.firstClosest = "UDU"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Prospector":
                self.firstClosest = "CD VS"
                self.secondClosest = "ED2/3"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Reese":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Robinson Hall":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Sanford Hall":
                self.firstClosest = "CD VS"
                self.secondClosest = "SOUTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Science Building":
                self.firstClosest = "ED2/3"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Scott Hall":
                self.firstClosest = "SOUTH"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Smith":
                self.firstClosest = "CD VS"
                self.secondClosest = "WEST"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Wells Fargo Field House":
                self.firstClosest = "WEST"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Winningham":
                self.firstClosest = "ED2/3"
                self.secondClosest = "CD VS"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Witherspoon":
                self.firstClosest = "NORTH"
                self.secondClosest = "UDU"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            case "Woodward Hall":
                //West deck, union(Student), cone 2, 1, south village (student)
                self.firstClosest="WEST"
                self.secondClosest = "SOUTH"
                self.buildingImage.image = UIImage(named: "woodward-hall")
            default:
                print(parkingDict["CD VS"]!)
                }
            
                let parking1: ParkingDeck = parkingDict[self.firstClosest!]!
                let parking2: ParkingDeck = parkingDict[self.secondClosest!]!
                self.selectDeck(parking1: parking1, parking2: parking2)
            
                self.deckLabel.text = self.parkingDeck
                self.deckProgressBar.constant = CGFloat(self.percentage ?? 0)
//                self.progressBar.progress = self.percentage ?? 0
                self.percentLabel.text = self.percentageAsString
        }
        
    }
    
    //choose the better deck
    func selectDeck(parking1: ParkingDeck, parking2: ParkingDeck) {
        //return the second deck if the first is starting to fill up
        if(parking1.percent < minCap && parking2.percent > minCap) {
            self.parkingDeck = parking2.name
            self.percentage = 100 - Float(parking2.percent * 100)
            self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "% Full"
            
        } else {
            self.parkingDeck = parking1.name
            self.percentage = 100 - Float(parking1.percent * 100)
            self.percentageAsString = String(format: "%.1f", Float(self.percentage!)) + "% Full"
        }
            
   
        
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
