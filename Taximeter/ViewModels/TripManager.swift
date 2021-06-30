//
//  Trip.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import Foundation

class TripManager: ObservableObject {
    @Published var isOutsideCity: Bool = false
    @Published var isLateNight: Bool = false
    @Published var price: UInt = 0
    
    var pricePerDistanceOrTime: UInt {
        return !isLateNight ? 100 : 120;
    }
    var startingPrice: UInt {
        return !isLateNight ? 3800 : 4600;
    }
    var finalPrice: Int {
        var extraChargePercent = 1.0
        if isLateNight { extraChargePercent += 0.2 }
        if isOutsideCity { extraChargePercent += 0.2 }
        return Int(Double(self.price) * extraChargePercent)
    }
    
    /// Start current trip by defining a new `Trip` instance and incrementing the price to the initial price.
    func startTrip() -> Void {
        self.price += self.startingPrice
    }
    
    func endTrip() -> Void {
        self.price = 0
//        Potentially end location tracking feature
    }
    
    func incrementPrice() -> Void {
        self.price += self.pricePerDistanceOrTime
    }
    
    
    
    
}
