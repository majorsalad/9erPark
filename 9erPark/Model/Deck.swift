//
//  Deck.swift
//  9erPark
//
//  Created by Faisal Salad on 3/29/21.
//

import Foundation

struct Deck : Codable {
   let lotCode: String
   let name: String
   var style: String?
   let mapLink: String?
   let percentAvailable: Double
}
