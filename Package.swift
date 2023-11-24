// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetUIFeature",
    products: [
        .library(
            name: "MetUIFeature",
            targets: ["MetUIFeature"]),
        .library(
            name: "LoadingView",
            targets: ["LoadingView"]),
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.3"),
    ],
    targets: [
        .target(
            name: "MetUIFeature"),
        .target(
            name: "LoadingView",
            dependencies: ["Lottie"]),
        .testTarget(
            name: "MetUIFeatureTests",
            dependencies: ["MetUIFeature"]),
    ]
)
