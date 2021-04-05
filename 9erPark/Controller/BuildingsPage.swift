//
//  BuildingSelect.swift
//  9erPark
//
//  Created by Faisal Salad on 3/24/21.
//

import UIKit

class BuildingsPage : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var buildingsArray = ["Athletic Storage", "Atkins", "Auxiliary Services Building", "Barnard", "Barnhardt Student Activity Center", "Baseball Indool Training Facility", "Belk Gymnasium", "Belk Hall", "BES Recycling Facility", "Bioinformatics", "Bissell House", "Burson", "Cafeteria Activities Building", "Cameron Hall", "Carriage House", "Cato College of Education", "Cato Hall", "Cedar", "Center City Building", "College of Health & Human Services", "Colvard", "Cone University Center", "Denny", "Duke Centennial Hall", "Early College High School", "EHS Storage Shed", "Elm", "EPIC", "Facilities Annex 3 Greenhouse","Fretwell","Friday","Gage Undergraduate Admissions Center", "Grigg", "Halton Wagner Tennix Complex", "Harris Alumni Center", "Hawthorne", "Hickory", "Hunt Hall", "Jerry Richardson Stadium", "Johnson Band Center", "Judy W. Rose Football Center", "Kennedy", "King", "Kulwicki Motorsports Laboratory", "McEniry","Memorial Hall","Miltimore Hall","Miltimore-Wallis Center","Motorsports Research","Popp Martin Student Union", "PORTAL", "Prospector","Reese","Robinson Hall", "Sanford Hall","Science Building", "Scott Hall","Smith","Wells Fargo Field House", "Winningham", "Witherspoon", "Woodward Hall"]
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
            destinationVC.buildingName = buildingsArray[myIndex]
        }
    }
}
