//
//  MeterButtonView.swift
//  Taximeter
//
//  Created by 박형상 on 9/03/21.
//

import SwiftUI

struct MeterButton: View {
    let isDisabled: Bool
    let action: () -> Void
    let topText: String
    let bottomText: String
    let backgroundColor: Color
    
    init(action: @escaping () -> Void, topText: String, bottomText: String, backgroundColor: Color, isDisabled: Bool = false) {
        self.action = action
        self.topText = topText
        self.bottomText = bottomText
        self.backgroundColor = backgroundColor
        self.isDisabled = isDisabled
    }

    var body: some View {
        Button(action: self.action) {
            VStack{
                Text(self.topText)
                Text(self.bottomText)
            }
            .frame(maxWidth: .infinity, minHeight: nil)
        }
        .padding(10)
        .background(self.backgroundColor)
        .cornerRadius(10.0, antialiased: true)
        .disabled(isDisabled)
    }
}

struct MeterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MeterButton(action: {}, topText: "Hello,", bottomText: "Button!", backgroundColor: .blue)
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
