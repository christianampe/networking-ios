// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Tyre",
    products: [
        .library(
            name: "Tyre",
            targets: ["Tyre"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Tyre",
            dependencies: []),
        .testTarget(
            name: "TyreTests",
            dependencies: ["Tyre"]),
    ]
)
