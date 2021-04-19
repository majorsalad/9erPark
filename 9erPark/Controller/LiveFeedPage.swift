//
//  LiveFeedPage.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class LiveFeedPage : UIViewController {
    
    
//    var width : CGFloat?
//    var deckName : String?
//    var percent : String?
    
    var parkingDict : Dictionary<String, ParkingDeck>?
    var i = 1

    @IBOutlet weak var deck1Label: UILabel!
    @IBOutlet weak var deck2Label: UILabel!
    @IBOutlet weak var deck3Label: UILabel!
    @IBOutlet weak var deck4Label: UILabel!
    @IBOutlet weak var deck5Label: UILabel!
    @IBOutlet weak var deck6Label: UILabel!
    @IBOutlet weak var deck7Label: UILabel!
    @IBOutlet weak var deck8Label: UILabel!
    @IBOutlet weak var deck9Label: UILabel!
    @IBOutlet weak var deck10Label: UILabel!
    
    
    @IBOutlet weak var deck1BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck2BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck3BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck4BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck5BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck6BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck7BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck8BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck9BarWidth: NSLayoutConstraint!
    
    @IBOutlet weak var deck10BarWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        
        for (key,value) in parkingDict! {
            
            switch i {
            case 1:
                deck1Label.text = value.name
                deck1BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 2:
                deck2Label.text = value.name
                deck2BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 3:
                deck3Label.text = value.name
                deck3BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 4:
                deck4Label.text = value.name
                deck4BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 5:
                deck5Label.text = value.name
                deck5BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 6:
                deck6Label.text = value.name
                deck6BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 7:
                deck7Label.text = value.name
                deck7BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 8:
                deck8Label.text = value.name
                deck8BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 9:
                deck9Label.text = value.name
                deck9BarWidth.constant = CGFloat((1-value.percent) * 253)
            case 10:
                deck10Label.text = value.name
                deck10BarWidth.constant = CGFloat((1-value.percent) * 253)
            default:
                print("default")
            }
            i+=1
        }
    }
}
