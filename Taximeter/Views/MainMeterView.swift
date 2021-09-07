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
    @State private var isFarePresented: Bool = false
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
                if tripManager.isOutsideCity {
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
                if tripManager.isLateNight {
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
            .padding([.vertical], 15.0)
            .padding([.horizontal], 10.0)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text("\(String(tripManager.price))원")
                        .font(.system(size: 60.0))
                    Text("\(countdownManager.countdown)")
                        .font(.largeTitle)
                        .onReceive(countdownManager.timer, perform: { _ in
                            if isInService {
                                countdownManager.decrementCountdown(incrementPriceOn: tripManager, currentSpeed: locationManager.speed)
                            }
                        })
                }
            }
            .padding([.horizontal], 10.0)
            
//            Image("horse1")
//                .resizable()
//                .antialiased(true)
//                .frame(maxWidth: 154, maxHeight: 100)
            
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
                    isFarePresented = true
                    countdownManager.clear()
                },
                isInService: $isInService,
                isOutsideCity: $tripManager.isOutsideCity,
                isLateNight: $tripManager.isLateNight
            )
        }
        .background(Color.black)
        .padding([.all], 5.0)
        .sheet(isPresented: $isFarePresented, onDismiss: {
            tripManager.endTrip()
        }) {
            NavigationView {
                VStack {
                    Text("Total Fare: $\(tripManager.finalPrice)")
                        .font(.title)
                }
                .navigationBarItems(leading: Button("Dismiss") {
                    isFarePresented = false
                }
                .foregroundColor(.white),
                trailing: Button("Add") {
                    isFarePresented = false
                }
                .foregroundColor(.white))
                .navigationTitle("Fare")
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct MainMeterView_Previews: PreviewProvider {
    static var previews: some View {
        MainMeterView()
            .preferredColorScheme(.dark)
    }
}
