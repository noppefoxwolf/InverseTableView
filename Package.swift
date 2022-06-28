// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "InverseTableView",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "InverseTableView",
            targets: ["InverseTableView"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "InverseTableView",
            dependencies: []),
        .testTarget(
            name: "InverseTableViewTests",
            dependencies: ["InverseTableView"]),
    ]
)
