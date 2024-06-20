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
        .library(name: "LiveVoiceSDK", targets: ["LiveVoiceSDK", "WebRTC"]),
    ],
    targets: [
        .binaryTarget(
            name: "LiveVoiceSDK",
            url: "https://sdk.livevoice.io/ios/sdk/1.0.0/LiveVoiceSDK.xcframework.zip",
            checksum: "3e895a5ead4ee9b75aec1b1a7b3a878982b1dd7ae19c6456937d2fe629081676"
        ),
        .binaryTarget(
            name: "WebRTC",
            url: "https://sdk.livevoice.io/ios/webrtc/WebRTC-M135.xcframework.zip",
            checksum: "f33336c74d7a5d42a257b0aeca2315b50473c611b74f22dac7e41c38cbe84351"
        )
    ]
)
