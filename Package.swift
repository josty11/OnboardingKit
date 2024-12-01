// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OnboardingKit",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "OnboardingKit",
            targets: ["OnboardingKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit", from: "5.0.0"),
    ],
    targets: [
        .target(
            name: "OnboardingKit",
            dependencies: ["SnapKit"]),
        .testTarget(
            name: "OnboardingKitTests",
            dependencies: ["OnboardingKit"]),
    ]
)
