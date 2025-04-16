//
//  AsyncButton.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI

public enum ButtonLoadingStyle {
    case leading
    case trailing
    case overlay
    case progressBar
    case replace
}

import SwiftUI

public struct AsyncButton<Label: View>: View {
    @Binding private var isLoading: Bool

    private let variant: ButtonVariant
    private let action: () async throws -> Void
    private let loadingStyle: ButtonLoadingStyle
    private let onError: ((Error) -> Void)?
    
    @ViewBuilder private let label: () -> Label
    
    public init(isLoading: Binding<Bool> = .constant(false),
                variant: ButtonVariant = .primary,
                loadingStyle: ButtonLoadingStyle = .overlay,
                onError: ((Error) -> Void)? = nil,
                action: @escaping () async throws -> Void,
                @ViewBuilder label: @escaping () -> Label) {
        self._isLoading = isLoading
        self.variant = variant
        self.loadingStyle = loadingStyle
        self.onError = onError
        self.action = action
        self.label = label
    }

    public var body: some View {
        Button {
            Task {
                isLoading = true
                do {
                    try await action()
                } catch {
                    onError?(error)
                }
                isLoading = false
            }
        } label: {
            ZStack {
                switch loadingStyle {
                case .replace:
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: variant.foregroundColor))
                    } else {
                        label()
                    }

                case .overlay:
                    label()
                        .opacity(isLoading ? 0.5 : 1)
                    if isLoading {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: variant.foregroundColor))
                    }

                case .leading:
                    HStack {
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: variant.foregroundColor))
                        }
                        label()
                    }

                case .trailing:
                    HStack {
                        label()
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: variant.foregroundColor))
                        }
                    }

                case .progressBar:
                    VStack(spacing: 4) {
                        label()
                        if isLoading {
                            ProgressView(value: 0.4)
                                .progressViewStyle(LinearProgressViewStyle(tint: variant.foregroundColor))
                        }
                    }
                }
            }
        }
        .buttonStyle(AsyncButtonStyle(variant: variant))
        .disabled(isLoading)
    }
}
