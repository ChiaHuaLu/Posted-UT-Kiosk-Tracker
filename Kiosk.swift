//
//  Kiosk.swift
//  Posted! UT Kiosk Tracker
//
//  Created by Chia Hua on 12/2/17.
//  Copyright © 2017 Chia Hua. All rights reserved.
//

import Foundation
class Kiosk {
    var latitude: Double
    var longitude: Double
    var name: String
    var posterCount: Int
    
    init(kioskName: String, latitude: Double, longitude: Double) {
        name = kioskName
        self.latitude = latitude
        self.longitude = longitude
        posterCount = 0
    }
    
    func decreaseCount() {
        posterCount -= 1
    }
    
    func increaseCount() {
        posterCount += 1
    }
    
    func initializeKiosks() -> [Kiosk] {
        var kioskNames: [String] = ["Kinsolving",     "SSB",     "RLM","Hearst Student Media", "Burdine",     "Bio", "Welch-Painter", "Guadalupe",     "FAC",   "Tower", "Waggner", "Winship", "Art Building",     "GSB", "Littlefield Fountain",     "PCL", "Gregory", "RecSports Center", "School of Music"]
        var latitude: [Double] = [    30.289897,  30.289754, 30.289301,              30.288817, 30.288587, 30.287434,       30.287372,   30.285797, 30.285912, 30.285683, 30.285526, 30.285587,      30.285494, 30.284337,              30.283790, 30.283373, 30.283512,          30.281537,         30.286861]
        var longitude: [Double] = [  -97.740086, -97.738839,-97.736685,             -97.740447,-97.738902,-97.740334,      -97.738315,  -97.741550,-97.740682,-97.739996,-97.737911,-97.734405,     -97.733426,-97.738590,             -97.739375,-97.737711,-97.737189,         -97.733091,        -97.730413]
        var allKiosks: [Kiosk] = []
        for index in 0...18 {
            allKiosks.append(Kiosk.init(kioskName: kioskNames[index], latitude: latitude[index], longitude: longitude[index]))
        }
        return allKiosks
    }
    
}
