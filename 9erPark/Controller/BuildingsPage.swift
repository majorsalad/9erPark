//
//  BuildingSelect.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class BuildingsPage : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var buildingsArray = ["Atkins", "Barnard", "Colvard", "Denny", "Fretwell", "Woodward"]
    var myIndex = 0
    
    override func viewDidLoad() {
       //
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildingsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = UITableViewCell()
        myCell.textLabel?.text = buildingsArray[indexPath.row]
        return myCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        myIndex = indexPath.row
        self.performSegue(withIdentifier: "goToOptimalPage", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOptimalPage" {
            let destinationVC = segue.destination as! OptimalPage
//            destinationVC.buildingName = buildingName
        }
    }
}
