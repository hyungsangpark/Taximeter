//
//  ButtonView.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import SwiftUI

struct ButtonView: View {
    var startDrive: () -> Void
    var endDrive: () -> Void
    @Binding var isInService: Bool
    @Binding var surcharge: Trip.Surcharge
    private func applicabilityText(condition: Bool) -> String {
        return condition ? "적용" : "미적용"
    }
    private func disabledButtonOpacity(disabled: Bool) -> Double {
        return disabled ? 0.4 : 1.0
    }
    var body: some View {
        HStack {
            Button(action: {
                startDrive()
                UIImpactFeedbackGenerator(style: .medium)
                    .impactOccurred()
            }) {
                Text("운행 시작")
                    .padding([.horizontal], 15)
            }
            .padding(10)
            .frame(maxWidth: .infinity, minHeight: nil)
            .background(Color(red: 0.93, green: 0.94, blue: 0.66)
                            .opacity(disabledButtonOpacity(disabled: isInService)))
            .cornerRadius(10.0, antialiased: true)
            .disabled(isInService)
//            TODO: Make buttons more realistic by adding vibrations and etc.
            
            Button(action: {
                endDrive()
                surcharge.isOutsideCity = false
                surcharge.isLateNight = false
                UIImpactFeedbackGenerator(style: .medium)
                    .impactOccurred()
            }) {
                Text("운행 종료")
                    .padding([.horizontal], 15)
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.90, green: 0.66, blue: 0.94)
                            .opacity(disabledButtonOpacity(disabled: !isInService)))
            .cornerRadius(10.0, antialiased: true)
            .disabled(!isInService)
            
            Button(action: {
                surcharge.isOutsideCity.toggle()
                UIImpactFeedbackGenerator(style: .medium)
                    .impactOccurred()
            }) {
                Text("시외할증\n\(applicabilityText(condition: surcharge.isOutsideCity))")
            }
            .padding(10)
            .frame(maxWidth: .infinity)
            .background(Color(red: 0.93, green: 0.75, blue: 0.60))
            .cornerRadius(10.0, antialiased: true)
            
            Button(action: {
                surcharge.isLateNight.toggle()
                UIImpactFeedbackGenerator(style: .medium)
                    .impactOccurred()
            }) {
                Text("심야할증\n\(applicabilityText(condition: surcharge.isLateNight))")
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
    static var previews: some View {
        ButtonView(
            startDrive: {},
            endDrive: {},
            isInService: .constant(false),
            surcharge: .constant(Trip.Surcharge(isOutsideCity: false, isLateNight: false))
        )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
