//
//  Countdown.swift
//  Taximeter
//
//  Created by 박형상 on 3/03/21.
//

import SwiftUI

struct CountdownView: View {
    @Binding var isInService: Bool
    @ObservedObject var tripManager: TripManager
    @ObservedObject var countdownManager: CountdownManager
    
    var body: some View {
        Text("\(countdownManager.countdown)")
            .font(.largeTitle)
            .onReceive(countdownManager.timer, perform: { _ in
                if isInService {
                    let currentSpeed = tripManager.speed < 15.33 ? 15.33 : tripManager.speed
                    let decrementValue = currentSpeed / 7.2
                    let remainingDecrementValue = Int(countdownManager.countdown) - Int(decrementValue)
                    let leftover = decrementValue.truncatingRemainder(dividingBy: 1)
                    
                    if remainingDecrementValue <= 0 {
                        countdownManager.countdown = tripManager.currentTrip.unitDistance
                        countdownManager.countdown -= UInt(-remainingDecrementValue)
                        tripManager.incrementPrice()
                    } else {
                        countdownManager.countdown -= UInt(decrementValue)
                    }
                    countdownManager.leftoverTime += leftover
                    
                    if countdownManager.leftoverTime >= 1.0 {
                        countdownManager.leftoverTime -= 1
                        countdownManager.countdown -= 1
                    }
                }
            })
    }
}

struct CountdownView_Previews: PreviewProvider {
    static let tripManager: TripManager = TripManager()
    static let countdownManager: CountdownManager = CountdownManager()
    static var previews: some View {
        CountdownView(isInService: .constant(true), tripManager: tripManager, countdownManager: countdownManager)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
