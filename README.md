# LiveVoice SDK for iOS

The iOS SDK for integrating the LiveVoice service into your app.

## Overview

The LiveVoice SDK enables your app to browse and listen to your configured LiveVoice channels,
as well as present a channel's live subtitles where available.

Using the LiveVoice SDK requires an account with SDK access enabled. Depending on your
subscription, the SDK allows for hiding the LiveVoice branding or building a fully customized
presentation. For more information contact sdk-support@livevoice.io. Once SDK access has been
granted, you can find your personal API key in the API key section of your account page at
https://livevoice.io/en/account/api.

## Features

- Browse and play the channels of a LiveVoice event
- Live subtitles where the channel provides them
- A drop-in `LiveVoiceView`, or a fully custom presentation with your own channel cells
- Audio output selection (speaker, receiver, headphones)
- Optional branding control and custom UI (subscription-dependent)

## Requirements

- iOS 15 or newer

## Installation

The SDK is distributed as a Swift package.

In Xcode, choose **File > Add Package Dependencies…** and enter the package URL:

```
https://github.com/LiveVoiceOfficial/livevoice-sdk-swift
```

Click **Add Package** and add the `LiveVoiceSDK` product to your app target.

Or, when integrating from a `Package.swift`, add the dependency:

```swift
dependencies: [
    .package(url: "https://github.com/LiveVoiceOfficial/livevoice-sdk-swift", from: "2.0.2"),
],
```

…then add the product to your target:

```swift
dependencies: [
    .product(name: "LiveVoiceSDK", package: "livevoice-sdk-swift"),
],
```

## Usage

There is no separate initialization step on iOS. Join an event via the `LiveVoice.shared`
singleton and render a `LiveVoiceView` to show its channels.

```swift
import SwiftUI
import LiveVoiceSDK

struct ContentView: View {
    var body: some View {
        LiveVoiceView()
            .task {
                await LiveVoice.shared.joinEvent(
                    joinCode: "YOUR_JOIN_CODE",
                    password: nil, // optional listener password
                    apiKey: "YOUR_API_KEY"
                )
            }
    }
}
```

The join code and password come from the event page of the admin web interface; the API key is
on your account page.

### Custom channel cells

To render your own channel rows instead of the built-in ones, provide a cell closure to
`LiveVoiceView`. The closure receives the view state, so you handle the ready, loading,
reconnecting, and error cases yourself.

```swift
// Custom cells require an API key that permits
// custom UI. If you provide a cell closure but
// the joined key isn't allowed, the SDK shows
// the invalid-api-key error instead of your cells.
LiveVoiceView { state in
    switch state {
    case let .ready(channel, isLast, onTap):
        MyCustomCell(channel: channel, isLast: isLast, onTap: onTap)
    case .loading:
        ProgressView()
    case let .error(error, retry):
        MyErrorView(error: error, retry: retry)
    case .reconnecting, .noMatchingChannels:
        EmptyView()
    @unknown default:
        EmptyView()
    }
}
```

### Background audio

To keep audio playing while the app is backgrounded or the screen is locked, add a background
mode to your app target: select the target, open **Signing & Capabilities**, add the
**Background Modes** capability if it isn't already present, and check **Audio, AirPlay, and
Picture in Picture**. Xcode writes the matching key into your Info.plist.

## Examples and support

The [example apps](https://github.com/LiveVoiceOfficial/livevoice-sdk-examples) are the best
place to start — each is a working integration you can run and read. Find your API key on your
[account page](https://livevoice.io/en/account/api). Questions: sdk-support@livevoice.io.

## License

MIT
