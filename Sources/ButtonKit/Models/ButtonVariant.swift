//
//  Untitled.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI

public enum ButtonVariant {
    case primary
    case secondary
    case destructive

    var backgroundColor: Color {
        switch self {
        case .primary: return .blue
        case .secondary: return .gray
        case .destructive: return .red
        }
    }

    var foregroundColor: Color {
        switch self {
        case .secondary: return .black
        default: return .white
        }
    }

    var pressedColor: Color {
        backgroundColor.opacity(0.7)
    }
}
