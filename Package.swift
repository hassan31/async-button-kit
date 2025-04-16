// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "ButtonKit",
    platforms: [
        .iOS(.v14), // or change to iOS 15/16 based on your target
    ],
    products: [
        .library(
            name: "ButtonKit",
            targets: ["ButtonKit"]
        ),
    ],
    targets: [
        .target(
            name: "ButtonKit",
            dependencies: []
        ),
        .testTarget(
            name: "ButtonKitTests",
            dependencies: ["ButtonKit"]
        ),
    ]
)
