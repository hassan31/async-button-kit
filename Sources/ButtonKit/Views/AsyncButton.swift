//
//  AsyncButton.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI

enum ButtonLoadingStyle {
    case leading
    case trailing
    case overlay
    case progressBar
    case replace
}

struct AsyncButton<Label: View>: View {
    var variant: ButtonVariant
    var action: () async throws -> Void
    var loadingStyle: ButtonLoadingStyle = .overlay
    var onError: ((Error) -> Void)? = nil
    @ViewBuilder var label: () -> Label

    @State private var isLoading = false

    var body: some View {
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
        .disabled(isLoading) // ✅ disables tap while loading
    }
}
