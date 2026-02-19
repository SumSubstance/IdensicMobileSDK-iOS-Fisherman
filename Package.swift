// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.41.1")

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    static let fisherman = "14a579537e2da8756a19edda7e920a87cebaec8c6123c4f79d24acd2c3139c22"
}

let package = Package(
    name: "IdensicMobileSDK_Fisherman",
    platforms: [
        .iOS("13.0")
    ],
    products: [
        .library(
            name: "IdensicMobileSDK_Fisherman",
            targets: [
                "FishermanWrapper"
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SumSubstance/IdensicMobileSDK-iOS.git", .exact(version)),
        .package(url: "https://github.com/fingerprintjs/fingerprintjs-pro-ios", "2.11.0" ..< "3.0.0")
    ],
    targets: [
        .binaryTarget(
            name: "IdensicMobileSDK_Fisherman",
            url: "\(gitUrl)/IdensicMobileSDK_Fisherman-\(version).zip",
            checksum: checksums.fisherman
        ),
        .target(
            name: "FishermanWrapper",
            dependencies: [
                .product(name: "IdensicMobileSDK", package: "IdensicMobileSDK-iOS"),
                "IdensicMobileSDK_Fisherman",
                .product(name: "FingerprintPro", package: "fingerprintjs-pro-ios")
            ],
            path: "FishermanWrapper"
        )
    ]
)
