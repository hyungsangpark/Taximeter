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
    private var onTaxiColor: Color {
        return self.isInService ? Color.green : Color.red
    }
    private var onTaxiText: String {
        return self.isInService ? "운행중" : "빈차"
    }
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text(onTaxiText)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.title2)
                        .foregroundColor(onTaxiColor)
                        .padding([.all], 7.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 7.5)
                                .stroke(onTaxiColor, lineWidth: 5.0)
                        )
                }
                
                Spacer()
                
                VStack {
                    Text("\(String(format: "%.1f", String(tripManager.speed))) km/h")
                        .font(.headline)
                    
                }
                .multilineTextAlignment(.trailing)
            }
            .padding([.bottom], 20.0)
            .padding([.horizontal], 10.0)
            
            HStack {
                Spacer()
                Text("\(String(tripManager.price)) 원")
                    .font(.custom("monospaced", size: 60.0))
            }
            .padding([.horizontal], 5.0)
            
            Spacer()
            
            ButtonView(
                startDrive: tripManager.startTrip(isOutsideCity:isLateNight:),
                endDrive: { () -> Void in
                    isInService = !isInService
                    print("function ran!")
                }
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
