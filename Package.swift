// swift-tools-version:5.0

// This file is part of the Loobee package.
//
// (c) Andrey Savitsky <contact@qroc.pro>
//
// For the full copyright and license information, please view the LICENSE
// file that was distributed with this source code.

import PackageDescription

let package = Package(
    name: "Loobee",
    products: [
        .library(name: "Loobee", targets: ["Loobee"])
    ],
    targets: [
        .target(
            name: "Loobee",
            dependencies: [],
            swiftSettings: [
                .unsafeFlags([
                    "-Xfrontend", "-warn-long-function-bodies=100",
                    "-Xfrontend", "-warn-long-expression-type-checking=100"
                ], .when(configuration: .debug))
            ]),
        .testTarget(name: "LoobeeTests", dependencies: ["Loobee"])
    ],
    swiftLanguageVersions: [.v5]
)
