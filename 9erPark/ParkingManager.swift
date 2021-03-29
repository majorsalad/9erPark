//
//  parkingManager.swift
//  apiPull
//
//  Created by Faisal Salad on 3/14/21.
//
 
import Foundation
 
protocol ParkingManagerDelegate {
    func didUpdateParking(_ parkingManager: ParkingManager, parkingDict: Dictionary<String, ParkingDeck>)
    func didFailWithError(error: Error)
}
 
struct ParkingManager {
    
    let urlString : String = "https://hidden-atoll-02697.herokuapp.com/"
    var delegate: ParkingManagerDelegate?
    
    func performRequest(){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if(error != nil){
                    self.delegate?.didFailWithError(error: error!)
                    return
                }
                
                if let safeData = data {
                    let parkingDict = parseJSON(safeData)
                    self.delegate?.didUpdateParking(self, parkingDict: parkingDict)
//                    for (key,value) in parkingDict {
//                        print(key)
//                        print(value)
//                    }
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(_ data : Data) -> Dictionary<String, ParkingDeck> {
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([Deck].self, from: data)
            var parkingDictionary = [String : ParkingDeck]()
            for deck in decodedData{
                let code = deck.lotCode
                let name = deck.name
                let map = deck.mapLink
                let percent = deck.percentAvailable
                let deckObject = ParkingDeck(lotCode: code, name: name, mapLink: map, percent: percent)
                parkingDictionary[code] = deckObject
            }
            return parkingDictionary
        } catch {
            print(error)
            let errorDict = [String : ParkingDeck]()
            return errorDict
        }
    }
 
    
}
