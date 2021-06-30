//
//  DistanceCountdownManager.swift
//  Taximeter
//
//  Created by 박형상 on 3/03/21.
//

import Foundation

class CountdownManager: ObservableObject {
    static let unitDistance: UInt = 132

    @Published var countdown: UInt = 2000
    @Published var leftoverTime: Double = 0.0
        
    var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    func decrementCountdown(tripManager: TripManager, currentSpeed speed: Double) -> Void {
        let currentSpeed = speed < 4.2583 ? 4.2583 : speed
        // Decrement value = current speed * countdown interval period
        let decrementValue = currentSpeed * 0.5
        let remainingDecrementValue = Int(countdown) - Int(decrementValue)
        let leftover = decrementValue.truncatingRemainder(dividingBy: 1)
        
        if remainingDecrementValue <= 0 {
            countdown = CountdownManager.unitDistance
            countdown -= UInt(-remainingDecrementValue)
            tripManager.incrementPrice()
        } else {
            countdown -= UInt(decrementValue)
        }
        leftoverTime += leftover
        
        if leftoverTime >= 1.0 {
            leftoverTime -= 1
            countdown -= 1
        }
    }
    
    func clear() -> Void {
        countdown = 2000
        leftoverTime = 0.0
    }
}
