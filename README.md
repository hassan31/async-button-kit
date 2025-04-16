# AsyncButtonKit

[![Swift](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org)
[![Platforms](https://img.shields.io/badge/Platform-iOS-blue)](https://developer.apple.com)
[![License](https://img.shields.io/badge/License-MIT-lightgrey.svg)](LICENSE)

AsyncButtonKit provides a custom SwiftUI `AsyncButton` component that supports `async`/`throws` actions with built-in loading indicators and customizable visual styles.

## Features

- ✅ Asynchronous and throwable action handling
- 🌀 Built-in loading states (spinner, progress bar, overlays)
- 🎨 Button variants and style customization
- � Easily composable with SwiftUI views
- 📱 Supports all Apple platforms (iOS)

## 📦 Installation

### Swift Package Manager

Add AsyncButtonKit to your Xcode project:

1. Open your project in Xcode
2. Select **File > Add Packages...**
3. Enter the repository URL: `https://github.com/hassan31/async-button-kit`
4. Select the version rule (recommend "Up to Next Major")
5. Click **Add Package**

## 🛠 Usage

### Basic Example

```swift
import AsyncButtonKit
import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        AsyncButton(
            isLoading: $isLoading,
            action: {
                try await performAsyncTask()
            },
            label: {
                Text("Submit")
                    .padding()
            }
        )
    }
    
    private func performAsyncTask() async throws {
        try await Task.sleep(nanoseconds: 2_000_000_000)
    }
}

## Customization Options
### Loading Styles
Control how the loading indicator appears:

```swift
AsyncButton(
    isLoading: $isLoading,
    loadingStyle: .leading, // Choose from:
    // .overlay (default)
    // .replace
    // .leading
    // .trailing
    // .progressBar
    action: { ... },
    label: { ... }
)
```

### Button Variants
Pre-defined visual styles:

```swift
AsyncButton(
    isLoading: $isLoading,
    variant: .primary, // Choose from:
    // .primary (default)
    // .secondary
    // .bordered
    // .danger
    action: { ... },
    label: { ... }
)
```

### Advanced Customization
You can extend the button styles by conforming to `AsyncButtonStyle` protocol:

```swift
extension AsyncButtonStyle where Self == CustomButtonStyle {
    static var custom: Self { ... }
}

AsyncButton(
    isLoading: $isLoading,
    style: .custom,
    action: { ... },
    label: { ... }
)
```

## 📝 Requirements
iOS 15.0+
Swift 5.9+
Xcode 15+

## 🤝 Contributing
Contributions are welcome! Please open an issue or submit a pull request.

## License
AsyncButtonKit is released under the MIT license. See LICENSE for details.

Made with ❤️ by @hassan31
