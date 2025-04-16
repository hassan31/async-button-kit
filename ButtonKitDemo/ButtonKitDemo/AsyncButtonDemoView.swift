//
//  AsyncButtonDemoView.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI
import ButtonKit

struct AsyncButtonDemoView: View {
    @State private var isReplaceLoading = false
    @State private var isLeadingLoading = false
    @State private var isTrailingLoading = false
    @State private var isOverlayLoading = false
    @State private var isProgressBarLoading = false

    var body: some View {
        VStack(spacing: 24) {
            Text("AsyncButtonKit Demo")
                .font(.title2)
                .bold()

            AsyncButton(
                isLoading: $isReplaceLoading,
                variant: .primary,
                loadingStyle: .replace,
                action: simulateLoading
            ) {
                Text("Replace Style")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }

            AsyncButton(
                isLoading: $isLeadingLoading,
                variant: .secondary,
                loadingStyle: .leading,
                action: simulateLoading
            ) {
                Text("Leading Spinner")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }

            AsyncButton(
                isLoading: $isTrailingLoading,
                variant: .destructive,
                loadingStyle: .trailing,
                action: simulateLoading
            ) {
                Text("Trailing Spinner")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }

            AsyncButton(
                isLoading: $isOverlayLoading,
                variant: .primary,
                loadingStyle: .overlay,
                action: simulateLoading
            ) {
                Text("Overlay Spinner")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }

            AsyncButton(
                isLoading: $isProgressBarLoading,
                variant: .secondary,
                loadingStyle: .progressBar,
                action: simulateLoading
            ) {
                Text("Progress Bar")
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
            }
        }
        .padding()
    }

    func simulateLoading() async throws {
        try await Task.sleep(nanoseconds: 2_000_000_000)
    }
}

#Preview {
    AsyncButtonDemoView()
}
