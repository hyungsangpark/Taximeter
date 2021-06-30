//
//  ContentView.swift
//  Taximeter
//
//  Created by 박형상 on 28/02/21.
//

import SwiftUI

struct MainMeterView: View {
    @StateObject private var tripManager: TripManager = TripManager()
    @StateObject private var countdownManager: CountdownManager = CountdownManager()
    @StateObject private var locationManager: LocationManager = LocationManager()
    @State private var isInService: Bool = false
    @State private var showNotYetImplementedAlert: Bool = false
    private var onTaxiColor: Color {
        return self.isInService ? Color.green : Color.red
    }
    private var onTaxiText: String {
        return self.isInService ? "주행" : "빈차"
    }
    var body: some View {
        VStack {
            HStack {
                Text(onTaxiText)
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(onTaxiColor)
                    .padding([.all], 7.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(onTaxiColor, lineWidth: 4.0)
                    )
                if tripManager.surcharge.isOutsideCity {
                    Text("시외")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.blue)
                        .padding([.all], 5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 3.0)
                        )
                        .padding([.leading], 5.0)
                }
                if tripManager.surcharge.isLateNight {
                    Text("심야")
                        .fontWeight(.bold)
                        .font(.title3)
                        .foregroundColor(.orange)
                        .padding([.all], 5.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.orange, lineWidth: 3.0)
                        )
                        .padding([.leading], 5.0)
                }
                
                Spacer()
                
                VStack {
                    Button(action: {
                        showNotYetImplementedAlert = true
                    }) {
                        Image(systemName: "gear")
                            .antialiased(true)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .alert(isPresented: $showNotYetImplementedAlert) {
                        Alert(
                            title: Text("Not implemented yet."),
                            message: Text("System preferences has yet been implemented.\nIt will soon be implemented.")
                        )
                    }
                }
                .multilineTextAlignment(.trailing)
            }
            .padding([.vertical], 15.0)
            .padding([.horizontal], 10.0)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(String(tripManager.price))원")
                        .font(.system(size: 60.0))
                    CountdownView(isInService: $isInService, tripManager: tripManager, countdownManager: countdownManager, locationManager: locationManager)
                }
            }
            .padding([.horizontal], 10.0)
            
            // =================================
            Spacer()
            // Line below used for debugging
            Text("Speed (m/s): \(String(locationManager.speed))")
            // =================================
            
            Spacer()
            
            ButtonRowView(
                startDrive: {
                    isInService = true
                    tripManager.startTrip()
                },
                endDrive: {
                    isInService = false
                    countdownManager.clear()
                    tripManager.endTrip()
                },
                isInService: $isInService,
                surcharge: $tripManager.surcharge
            )
        }
        .background(Color.black)
        .padding([.all], 5.0)
    }
}

struct MainMeterView_Previews: PreviewProvider {
    static var previews: some View {
        MainMeterView()
            .preferredColorScheme(.dark)
    }
}
