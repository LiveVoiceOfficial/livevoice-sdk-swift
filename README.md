# LiveVoice SDK for iOS

The iOS SDK for integrating the LiveVoice service into your app.

## Overview

The LiveVoice SDK enables your app to join a LiveVoice event, show and play its channels, and
present a channel's live subtitles where available. The SDK plays audio and shows subtitles;
video will be supported in an upcoming version.

Using the LiveVoice SDK requires an account with SDK access enabled. Depending on your
subscription, the SDK allows for hiding the LiveVoice branding or building a fully customized
presentation. For more information contact sdk-support@livevoice.io. Once SDK access has been
granted, you can find your personal API key in the 'API/SDK Keys' section of your account page at
https://livevoice.io/en/account/api.

## Features

- Show and play the channels of a LiveVoice event
- Live subtitles where the channel provides them
- A drop-in `LiveVoiceView`, or a custom presentation with your own channel cells
- Password-protected events and channels, with the SDK's password prompt or your own
- Audio output selection (the system's route or the loudspeaker)
- The playing channel on the Lock Screen and in Control Center
- Optional branding control and custom UI (subscription-dependent)

## Requirements

- iOS 15 or newer
- Xcode 26.5 or newer (Swift 6.3)

## Installation

The SDK is distributed as a Swift package only.

In Xcode, choose **File > Add Package Dependencies…** and enter the package URL:

```
https://github.com/LiveVoiceOfficial/livevoice-sdk-swift
```

Click **Add Package** and add the `LiveVoiceSDK` product to your app target.

Or, when integrating from a `Package.swift`, add the dependency:

```swift
dependencies: [
    .package(url: "https://github.com/LiveVoiceOfficial/livevoice-sdk-swift", from: "3.0.0"),
],
```

…then add the product to your target:

```swift
dependencies: [
    .product(name: "LiveVoiceSDK", package: "livevoice-sdk-swift"),
],
```

## Usage

Join an event via the `LiveVoice.shared` singleton, render a `LiveVoiceView` to show its
channels, and leave the event when the screen goes away.

```swift
import SwiftUI
import LiveVoiceSDK

struct EventScreen: View {
    @State private var joined: LiveVoiceJoinedEvent?

    var body: some View {
        LiveVoiceView()
            .task {
                do throws(LiveVoiceError) {
                    joined = try await LiveVoice.shared.joinEvent(
                        joinCode: "YOUR_JOIN_CODE",
                        password: nil, // optional event password
                        apiKey: "YOUR_API_KEY"
                    )
                } catch {
                    // error.code says what went wrong.
                }
            }
            .onDisappear {
                // Leaves only this screen's join, never a newer one.
                Task { try? await joined?.leave() }
            }
    }
}
```

The join code and password come from the event page of the admin web interface; the API key is
in the 'API/SDK Keys' section of your account page.

`joinEvent` returns once the event is ready, so a channel can be started right away. A channel
starts when it is tapped in the `LiveVoiceView`; `LiveVoice.shared.stopChannel()` stops it from
your own code. `LiveVoiceView` shows joining, reconnecting and errors by itself. A join that
fails throws a `LiveVoiceError`: its `code` says why, `isRetryable` whether trying again can
help, and `message` is localized text you can show. `LiveVoice.shared.leaveEvent()` leaves
whatever event is joined or joining.

There is no required initialization step on iOS. To choose how LiveVoice plays alongside other
audio, or to turn off the system's media controls, call
`LiveVoice.shared.initialize(audioFocus:showsSystemMediaControls:)` before joining.

### Custom channel cells

To render your own channel rows instead of the built-in ones, add `channelCell` to
`LiveVoiceView`. Your cell receives a `LiveVoiceChannelCell` with the channel and the action
that starts or stops it. The loading, reconnecting, error and empty presentations keep the
SDK's design unless you replace them with `loading`, `reconnecting`, `error` and `empty`.

```swift
// Custom cells require an API key that permits
// custom UI. Without that permission, the SDK shows
// the invalid-api-key error instead of your cells.
LiveVoiceView()
    .channelCell { cell in
        Button(cell.channel.name) {
            Task { try? await cell.togglePlayback() }
        }
        .disabled(!cell.isEnabled)
    }
```

### Background audio

To keep audio playing while the app is backgrounded or the screen is locked, add a background
mode to your app target: select the app target in Xcode, open **Signing & Capabilities**, add the
**Background Modes** capability if it isn't already present, and check **Audio, AirPlay, and
Picture in Picture**. Xcode writes the matching key into your Info.plist.

## Documentation

Every public type and method carries inline documentation, shown in Xcode's Quick Help.

## Migrating from 2.x

SDK 3.0 changes the API. See `ios/MIGRATION.md` in the
[example apps](https://github.com/LiveVoiceOfficial/livevoice-sdk-examples) repository.

## Examples and support

The [example apps](https://github.com/LiveVoiceOfficial/livevoice-sdk-examples) are the best
place to start — each is a working integration you can run and read. Questions:
sdk-support@livevoice.io.

## License

MIT
