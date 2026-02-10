// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let version = Version("1.41.0")

let gitUrl = "https://raw.githubusercontent.com/SumSubstance/IdensicMobileSDK-iOS-Release/master/\(version)"

enum checksums {
    static let fisherman = "5003741f3995842b1915c124d87b2cde5199132ed3d63f5ca4f6617908afe56c"
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
