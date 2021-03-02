//
//  ContentView.swift
//  Taximeter
//
//  Created by 박형상 on 28/02/21.
//

import SwiftUI

struct MainMeterView: View {
    @StateObject private var tripManager: TripManager = TripManager()
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
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                    .foregroundColor(onTaxiColor)
                    .padding([.all], 7.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7.5)
                            .stroke(onTaxiColor, lineWidth: 4.0)
                    )
                
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
                            message: Text("System preferences has yet been implemented.\nIt will soon be implemented."),
                            dismissButton: .default(Text("Okay"))
                        )
                    }
                }
                .multilineTextAlignment(.trailing)
            }
            .padding([.vertical], 15.0)
            .padding([.horizontal], 10.0)
            
            HStack {
                Spacer()
                Text("\(String(tripManager.price)) 원")
                    .font(.custom("monospaced", size: 60.0))
            }
            .padding([.horizontal], 5.0)
            
            Spacer()
            
            ButtonView(
                startDrive: {
                    isInService = true
                    tripManager.startTrip()
                },
                endDrive: {
                    isInService = false
                    tripManager.endTrip()
                },
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
