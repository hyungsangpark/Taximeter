//
//  ContentView.swift
//  Taximeter
//
//  Created by 박형상 on 28/02/21.
//

import SwiftUI

struct MainMeterView: View {
    @State private var outsideCityApplicabilityText: String = "미적용"
    @State private var lateNightApplicabilityText: String = "미적용"
    @State private var price: UInt = 0
    @State private var speed: Double = 0.0
    private func switchApplicability(condition string: inout String) {
        string = string == "미적용" ? "적용" : "미적용"
    }
//    private let buttonTypes: [String] = ["운행 시작", "운행 종료", "시외 할증", "심야 할증"]
    var body: some View {
        VStack {
            
            HStack {
                VStack {
                    Text("Hey")
                }
                
                Spacer()
                
                VStack {
                    Text("\(String(format: "%.1f", speed)) km/h")
                        .font(.headline)
                    
                }
            }
            .padding([.bottom], 20.0)
            
            HStack {
                Spacer()
                Text("\(price) 원")
                    .font(.custom("monospaced", size: 60.0))
            }
            .padding([.horizontal], 5.0)
            
            Spacer()
            
            HStack {
                HStack {
                    Button(action: {
                        price += 100
                    }) {
                        Text("운행 시작")
                            .padding([.horizontal], 15)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity, minHeight: nil)
                    .background(Color(red: 0.90, green: 0.66, blue: 0.94))
                    .cornerRadius(10.0, antialiased: true)
                    
                    Button(action: {}) {
                        Text("운행 종료")
                            .padding([.horizontal], 15)
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.93, green: 0.94, blue: 0.66))
                    .cornerRadius(10.0, antialiased: true)
                    
                    Button(action: {switchApplicability(condition: &outsideCityApplicabilityText)}) {
                        Text("시외할증\n\(outsideCityApplicabilityText)")
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.93, green: 0.75, blue: 0.60))
                    .cornerRadius(10.0, antialiased: true)
                    
                    Button(action: {switchApplicability(condition: &lateNightApplicabilityText)}) {
                        Text("심야할증\n\(lateNightApplicabilityText)")
                    }
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .background(Color(red: 0.60, green: 0.82, blue: 0.93))
                    .cornerRadius(10.0, antialiased: true)
                }
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                
            }
            .padding([.horizontal], 10.0)
            .padding([.vertical], 20.0)
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
