// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MovieServer",
    dependencies: [
        .package(url: "https://github.com/apple/swift-nio.git", .exact("1.6.0")),
        .package(url: "https://github.com/apple/swift-protobuf.git", .exact("1.0.3"))
    ],
    targets: [
        .target(
            name: "MovieServer",
            dependencies: ["NIO", "SwiftProtobuf"]),
    ]
)
