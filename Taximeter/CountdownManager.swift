//
//  DistanceCountdownManager.swift
//  Taximeter
//
//  Created by 박형상 on 3/03/21.
//

import Foundation

class CountdownManager: ObservableObject {
    @Published var countdown: UInt = 2000
    @Published var leftoverTime: Double = 0.0
    var timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    func clear() -> Void {
        countdown = 2000
        leftoverTime = 0.0
    }
}
