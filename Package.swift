// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AsyncButtonKit",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "AsyncButtonKit",
            targets: ["ButtonKit"]
        ),
    ],
    targets: [
        .target(
            name: "ButtonKit",
            path: "Sources/ButtonKit"
        )
    ]
)
