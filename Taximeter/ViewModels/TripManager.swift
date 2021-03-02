//
//  Trip.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import Foundation

class TripManager: ObservableObject {
    var currentTrip: Trip = Trip()
    @Published var surcharge: Trip.Surcharge = Trip.Surcharge(isOutsideCity: false, isLateNight: false)
    @Published var speed: Double = 0.0
    @Published var distance: Double = 0.0
    @Published var price: UInt = 0
    var finalPrice: Int {
        var extraChargePercent = 1.0
        if currentTrip.surcharge.isLateNight {
            extraChargePercent += 0.2
        }
        if currentTrip.surcharge.isOutsideCity {
            extraChargePercent += 0.2
        }
        return Int(Double(self.price) * extraChargePercent)
    }
    
    /// Start current trip by defining a new `Trip` instance and incrementing the price to the initial price.
    func startTrip() -> Void {
        self.currentTrip = Trip(surcharge: surcharge)
        self.price += self.currentTrip.startingPrice
    }
    
    func endTrip() -> Void {
        self.price = 0
//        Potentially end location tracking feature
    }
    
    func incrementPrice() -> Void {
        self.price += currentTrip.pricePerDistanceOrTime
    }
    
    
    
    
}
