//
//  AsyncButtonStyle.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI

struct AsyncButtonStyle: ButtonStyle {
    var variant: ButtonVariant

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .frame(maxWidth: .infinity)
            .background(configuration.isPressed ? variant.pressedColor : variant.backgroundColor)
            .foregroundColor(variant.foregroundColor)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.98 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}
