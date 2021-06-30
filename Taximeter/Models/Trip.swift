////
////  Trip.swift
////  Taximeter
////
////  Created by 박형상 on 1/03/21.
////
//
//import Foundation
//
//struct Trip {
//    
//    struct Surcharge {
//        var isOutsideCity: Bool
//        var isLateNight: Bool
//    }
//    
//    let surcharge: Surcharge
//    let pricePerDistanceOrTime: UInt
//    let startingPrice: UInt
//    
//    init(surcharge: Surcharge = Surcharge(isOutsideCity: false, isLateNight: false)) {
//        self.surcharge = surcharge
//        if !self.surcharge.isLateNight {
//            self.pricePerDistanceOrTime = 100
//            self.startingPrice = 3800
//        } else {
//            self.pricePerDistanceOrTime = 120
//            self.startingPrice = 4600
//        }
//    }
//}
