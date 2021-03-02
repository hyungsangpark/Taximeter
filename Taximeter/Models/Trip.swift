//
//  Trip.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import Foundation

struct Trip {
    let isOutsideCity: Bool
    let isLateNight: Bool
    let pricePerDistanceOrTime: UInt
    let startingPrice: UInt
    
    init(isOutsideCity: Bool, isLateNight: Bool) {
        self.isOutsideCity = isOutsideCity
        self.isLateNight = isLateNight
        if !self.isLateNight {
            self.pricePerDistanceOrTime = 100
            self.startingPrice = 3800
        } else {
            self.pricePerDistanceOrTime = 120
            self.startingPrice = 4600
        }
    }
}
