//
//  LocationManager.swift
//  Taximeter
//
//  Created by 박형상 on 29/06/21.
//

import Foundation
import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var authorizationStatus: CLAuthorizationStatus
    @Published var speed: Double = 0.0
//    var lastLocation: CLLocation?
//    @Published var travelledDistance
    
    private let locationManager: CLLocationManager
    
    override init() {
        locationManager = CLLocationManager()
        authorizationStatus = locationManager.authorizationStatus
        
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
//    func requestPermission() {
//        locationManager.requestWhenInUseAuthorization()
//    }
//
//    func distanceTravelledFromLastLocation() -> Int {
//        if lastLocation ==
//    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        authorizationStatus = manager.authorizationStatus
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        speed = location.speed
    }
    
    
    
    
    
}
