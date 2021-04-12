//
//  ViewController.swift
//  9erPark
//
//  Created by Joey Thompson on 3/9/21.
//

import UIKit

class HomePage: UIViewController, ParkingManagerDelegate {

    @IBOutlet weak var findOptimalButton: UIButton!
    var parkingInfo: Dictionary<String, ParkingDeck>?
    var parkingManager = ParkingManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //edgesForExtendedLayout = []
        findOptimalButton.layer.cornerRadius = 19
        parkingManager.delegate = self
        parkingManager.performRequest()
    }
    
    func didUpdateParking(_ parkingManager: ParkingManager, parkingDict: Dictionary<String, ParkingDeck>) {
        DispatchQueue.main.async{
            self.parkingInfo =  parkingDict
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }

    @IBAction func liveParkingPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToPercentages", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPercentages" {
            let destinationVC = segue.destination as! LiveFeedPage
            destinationVC.parkingDict = parkingInfo
//            destinationVC.deckName = "Test Deck"
//            destinationVC.width = 0.5 * 253
//            destinationVC.percent = "50% Available"
        }
    }
    
    
    
}

