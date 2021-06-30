//
//  ButtonView.swift
//  Taximeter
//
//  Created by 박형상 on 1/03/21.
//

import SwiftUI

struct ButtonRowView: View {
    var startDrive: () -> Void
    var endDrive: () -> Void
    
    @Binding var isInService: Bool
    @Binding var isOutsideCity: Bool
    @Binding var isLateNight: Bool
    
    private func disabledButtonOpacity(disabled: Bool) -> Double {
        return disabled ? 0.4 : 1.0
    }
    
    var body: some View {
        HStack {
            MeterButton(
                action: {
                    startDrive()
                    UIImpactFeedbackGenerator(style: .medium)
                        .impactOccurred()
                },
                topText: "운행",
                bottomText: "시작",
                backgroundColor: Color(red: 0.93, green: 0.94, blue: 0.66)
                    .opacity(disabledButtonOpacity(disabled: isInService)),
                isDisabled: isInService
            )
            
            MeterButton(
                action: {
                    endDrive()
                    isOutsideCity = false
                    isLateNight = false
                    UIImpactFeedbackGenerator(style: .medium)
                        .impactOccurred()
                },
                topText: "운행",
                bottomText: "종료",
                backgroundColor: Color(red: 0.90, green: 0.66, blue: 0.94)
                    .opacity(disabledButtonOpacity(disabled: !isInService)),
                isDisabled: !isInService
            )
            
            MeterButton(
                action: {
                    isOutsideCity.toggle()
                    UIImpactFeedbackGenerator(style: .medium)
                        .impactOccurred()
                },
                topText: "시외",
                bottomText: "할증",
                backgroundColor: Color(red: 0.60, green: 0.82, blue: 0.93)
            )

            MeterButton(
                action: {
                    isLateNight.toggle()
                    
                    UIImpactFeedbackGenerator(style: .medium)
                        .impactOccurred()
                },
                topText: "심야",
                bottomText: "할증",
                backgroundColor: Color(red: 0.93, green: 0.75, blue: 0.60)
            )
        }
        .multilineTextAlignment(.center)
        .foregroundColor(.black)
        .padding([.horizontal], 10.0)
        .padding([.vertical], 20.0)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRowView(
            startDrive: {},
            endDrive: {},
            isInService: .constant(false),
            isOutsideCity: .constant(false),
            isLateNight: .constant(false)
        )
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
