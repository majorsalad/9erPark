//
//  LiveFeedPage.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class LiveFeedPage : UIViewController {
    
    
    var width : CGFloat?
    var deckName : String?
    var percent : String?
    
    @IBOutlet weak var deck1Label: UILabel!
    @IBOutlet weak var progressBarLabel: UIView!
    @IBOutlet weak var percent1Label: UILabel!
    @IBOutlet weak var progressBarWidth: NSLayoutConstraint!
    
    override func viewDidLoad() {
        deck1Label.text = deckName!
        progressBarWidth.constant = width!
        percent1Label.text = percent!
    }
}
