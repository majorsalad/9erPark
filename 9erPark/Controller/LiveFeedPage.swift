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
    
    
    @IBOutlet weak var percentLabel1: UILabel!
    @IBOutlet weak var percentLabel2: UILabel!
    @IBOutlet weak var percentLabel3: UILabel!
    @IBOutlet weak var percentLabel4: UILabel!
    @IBOutlet weak var percentLabel5: UILabel!
    @IBOutlet weak var percentLabel6: UILabel!
    @IBOutlet weak var percentLabel7: UILabel!
    @IBOutlet weak var percentLabel8: UILabel!
    @IBOutlet weak var percentLabel9: UILabel!
    @IBOutlet weak var percentLabel10: UILabel!
    
    
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
                percentLabel1.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 2:
                deck2Label.text = value.name
                deck2BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel2.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 3:
                deck3Label.text = value.name
                deck3BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel3.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 4:
                deck4Label.text = value.name
                deck4BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel4.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 5:
                deck5Label.text = value.name
                deck5BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel5.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 6:
                deck6Label.text = value.name
                deck6BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel6.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 7:
                deck7Label.text = value.name
                deck7BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel7.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 8:
                deck8Label.text = value.name
                deck8BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel8.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 9:
                deck9Label.text = value.name
                deck9BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel9.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            case 10:
                deck10Label.text = value.name
                deck10BarWidth.constant = CGFloat((1-value.percent) * 253)
                percentLabel10.text = String(format: "%.1f", Float((1-value.percent)) * 100) + "% Full"
            default:
                print("default")
            }
            i+=1
        }
    }
}
