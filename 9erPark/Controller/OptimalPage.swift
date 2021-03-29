//
//  OptimalPage.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class OptimalPage : UIViewController {
    
    var buildingName : String?
    
    @IBOutlet weak var buildingLabel: UILabel!
    @IBOutlet weak var deckLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var percentLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        buildingLabel.text = buildingName
    }
}
