// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "xcbeautify",
    products: [
        .executable(name: "xcbeautify", targets: ["xcbeautify"]),
        .library(name: "XcbeautifyLib", targets: ["XcbeautifyLib"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/apple/swift-argument-parser.git",
            .upToNextMinor(from: "1.4.0")
        ),
        .package(
            url: "https://github.com/getGuaka/Colorizer.git",
            .upToNextMinor(from: "0.2.1")
        ),
        .package(
            url: "https://github.com/MaxDesiatov/XMLCoder.git",
            .upToNextMinor(from: "0.17.1")
        ),
    ],
    targets: [
        .executableTarget(
            name: "xcbeautify",
            dependencies: [
                "XcbeautifyLib",
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
            ]
        ),
        .target(
            name: "XcbeautifyLib",
            dependencies: [
                "Colorizer",
                "XMLCoder",
            ]
        ),
        .testTarget(
            name: "XcbeautifyLibTests",
            dependencies: ["XcbeautifyLib"],
            resources: [
                .copy("ParsingTests/clean_build_xcode_15_1.txt"),
                .copy("ParsingTests/large_xcodebuild_log.txt"),
            ]
        ),
    ]
)
