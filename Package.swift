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
            url: "https://sdk.livevoice.io/ios/sdk/1.0.1/LiveVoiceSDK.xcframework.zip",
            checksum: "4bc3c06d6c29a28af5272196e081d93e693076603eff4be753c1082783288f13"
        ),
        .binaryTarget(
            name: "LiveVoiceRTC",
            url: "https://sdk.livevoice.io/ios/webrtc/WebRTC-M136.xcframework.zip",
            checksum: "1d6f76b91ca6d40a143cec093781e3cc954a6754edced4662851aaead96e19ef"
        )
    ]
)
