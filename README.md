# 🔘 ButtonKit – Async & Throwable SwiftUI Buttons

**ButtonKit** provides a flexible and reusable set of SwiftUI buttons that support asynchronous and throwable actions out of the box. It includes built-in loading states, styling variants, and multiple loading indicators like spinners and progress bars.

---

## ✨ Features

- ✅ Supports `async` and `throws` actions
- 🔄 Auto handles loading state with spinner/progress UI
- 🎨 Customizable button variants: `.primary`, `.secondary`, `.destructive`
- 📍 Multiple loading styles:
  - `.replace` – Replaces content with spinner
  - `.leading` – Spinner on the left of label
  - `.trailing` – Spinner on the right of label
  - `.overlay` – Spinner overlaid on top of content
  - `.progressBar` – Linear progress under the label
- 🧱 Built using native SwiftUI components
- 🧰 Easily extensible and composable

---

## 📦 Installation

Currently, ButtonKit is implemented as part of the SwiftUI app project. You can extract it into a Swift Package if needed (see `To Do` below).

---

## 🚀 Usage

```swift
AsyncButton(
    variant: .primary,
    action: {
        try await Task.sleep(nanoseconds: 2_000_000_000)
    },
    loadingStyle: .leading
) {
    Text("Submit")
}
