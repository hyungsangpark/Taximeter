//
//  ButtonView.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import SwiftUI

struct ButtonView: View {
    var startDrive: (Bool, Bool) -> Void
    var endDrive: () -> Void
    @State private var isOutsideCity: Bool = false
    @State private var isLateNight: Bool = false
    private func applicabilityText(condition: Bool) -> String {
        return condition ? "적용" : "미적용"
    }
    var body: some View {
        HStack {
            Button(action: {
                startDrive(isOutsideCity, isLateNight)
            }) {
                Text("운행 시작")
                    .padding([.horizontal], 15)
            }
            .padding(10)
            .frame(maxWidth: .infinity, minHeight: nil)
            .background(Color(red: 0.90, green: 0.66, blue: 0.94))
            .cornerRadius(10.0, antialiased: true)
            
            Button(action: endDrive) {
                Text("운행 종료")
                    .padding([.horizontal], 15)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.93, green: 0.94, blue: 0.66))
            .cornerRadius(10.0, antialiased: true)
            
            Button(action: {isOutsideCity = !isOutsideCity}) {
                Text("시외할증\n\(applicabilityText(condition: isOutsideCity))")
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.93, green: 0.75, blue: 0.60))
            .cornerRadius(10.0, antialiased: true)
            
            Button(action: {isLateNight = !isLateNight}) {
                Text("심야할증\n\(applicabilityText(condition: isLateNight))")
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.60, green: 0.82, blue: 0.93))
            .cornerRadius(10.0, antialiased: true)
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.black)
        .padding([.horizontal], 10.0)
        .padding([.vertical], 20.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static func startDrive(cond1: Bool, cond2: Bool) -> Void {
        Swift.print("Start Drive!!")
    }
    static func endDrive() -> Void {
        Swift.print("End drive")
    }
    static var previews: some View {
        ButtonView(startDrive: startDrive(cond1:cond2:), endDrive: endDrive)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
