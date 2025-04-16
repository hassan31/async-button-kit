//
//  AsyncButtonDemoView.swift
//  ButtonKitDemo
//
//  Created by Muhammad Hassan on 2025-04-16.
//

import SwiftUI

struct AsyncButtonDemoView: View {
    var body: some View {
        VStack(spacing: 20) {
            AsyncButton(variant: .primary, action: simulateLoading, loadingStyle: .replace) {
                Text("Replace Style")
            }

            AsyncButton(variant: .secondary, action: simulateLoading, loadingStyle: .leading) {
                Text("Leading Spinner")
            }

            AsyncButton(variant: .destructive, action: simulateLoading, loadingStyle: .trailing) {
                Text("Trailing Spinner")
            }

            AsyncButton(variant: .primary, action: simulateLoading, loadingStyle: .overlay) {
                Text("Overlay Spinner")
            }

            AsyncButton(variant: .secondary, action: simulateLoading, loadingStyle: .progressBar) {
                Text("Progress Bar")
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
