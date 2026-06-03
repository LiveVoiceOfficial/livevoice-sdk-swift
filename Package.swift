// swift-tools-version: 5.10
// ===----------------------------------------------------------------------===//
//
//  This source file is part of the LiveVoice SDK project
//
//  Copyright (c) LiveVoice GmbH
//  Licensed under the MIT license
//
//  See LICENSE.txt for license information
//
//  SPDX-License-Identifier: MIT
//
// ===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "swift-livevoice-sdk",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "LiveVoiceSDK", targets: ["LiveVoiceSDK", "LiveVoiceRTC"]),
    ],
    targets: [
        .binaryTarget(
            name: "LiveVoiceSDK",
            url: "https://sdk.livevoice.io/ios/sdk/2.0.0/LiveVoiceSDK.xcframework.zip",
            checksum: "579646a9e82322755b3f62d713ae89a9bc683f2591436d5e57cb28d9251b18ab"
        ),
        .binaryTarget(
            name: "LiveVoiceRTC",
            url: "https://sdk.livevoice.io/ios/webrtc/WebRTC-M140.xcframework.zip",
            checksum: "0d61faf67dd145545bf8a0017bdcdbe7a9a1f3a96cce0d501e526655711d98d2"
        )
    ]
)
