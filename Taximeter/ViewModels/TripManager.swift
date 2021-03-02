//
//  Trip.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import Foundation

class TripManager: ObservableObject {
    var currentTrip: Trip = Trip(isOutsideCity: false, isLateNight: false)
    @Published var speed: Double = 0.0
    @Published var price: UInt = 0
    
    func startTrip(isOutsideCity: Bool, isLateNight: Bool) -> Void {
        self.currentTrip = Trip(isOutsideCity: isOutsideCity, isLateNight: isLateNight)
        self.price += self.currentTrip.startingPrice
    }
    
    func endTrip() -> Void {
//        Potentially end location tracking feature
    }
    
    func incrementPrice() -> Void {
        self.price += currentTrip.pricePerDistanceOrTime
    }
    
    
}
