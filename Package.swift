// swift-tools-version: 6.1
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
            url: "https://sdk.livevoice.io/ios/sdk/3.0.0/LiveVoiceSDK.xcframework.zip",
            checksum: "dabb0881f395c0134ac0c943e52e327fb34dc891a4df14f7e9d5ac6ca105b21e"
        ),
        .binaryTarget(
            name: "LiveVoiceRTC",
            url: "https://sdk.livevoice.io/lv-webrtc/M156/darwin/WebRTC-M156.xcframework.zip",
            checksum: "2e5a6af014a58df29a98f76ba3ac550ca264a705192bdf0c6927be6dd2dad205"
        )
    ]
)
