// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MetUIFeature",
    products: [
        .library(
            name: "MetUIFeature",
            targets: ["MetUIFeature"])
    ],
    dependencies: [
        .package(url: "https://github.com/airbnb/lottie-spm.git", from: "4.3.3"),
    ],
    targets: [
        .target(
            name: "MetUIFeature",
            dependencies: ["lottie-spm"],
            resources: [
                .process("Resources/loading.json")
            ]),
//        
//        .target(
//            name: "LoadingView",
//            dependencies: ["lottie-spm"],
//            resources: [
//                .process("Resources/loading.json")
//            ]),
        .testTarget(
            name: "MetUIFeatureTests",
            dependencies: ["MetUIFeature"]),
    ]
)
