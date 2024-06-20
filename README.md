# LiveVoice SDK

The iOS SDK for integrating the LiveVoice service into your app.

## Overview

The LiveVoice SDK enables your app to browse and listen to your configured LiveVoice channels.

Depending on your subscription, the SDK allows for hiding the LiveVoice branding or using a fully 
customized presentation.

Using the LiveVoice SDK requires an account with SDK access enabled. For more information contact
sdk-support@livevoice.io .

Once SDK access has been granted, you can see your personal API-key at the bottom of your account 
page at https://livevoice.io/en/account .

## Supported Platforms

- iOS 15+

## Background Audio Support

To allow your app to continue playing audio in the background, you need to add the appropriate 
background mode to your app's capabilities.

Klick the project in Xcode's project navigator and select your target. In the 
`Signing and Capabilities` tab, add the `Background Modes` Capability (if it isn't already present) 
and check the `Voice over IP` box. This will add the proper key to your app's Info.plist file.

## Getting Started

To install the SDK in your Xcode project, go to **File > Add Package Dependencies…** and paste the 
url of the SDK ([https://github.com/LiveVoiceOfficial/livevoice-sdk-swift](https://github.com/LiveVoiceOfficial/livevoice-sdk-swift)) into the search field.
Click on **Add Package** and pick your app target.

Alternatively when integrating into a Swift package using the Swift Package Manager, add the 
following dependency to your Package.swift:

```swift
dependencies: [
    .package(url: "https://github.com/LiveVoiceOfficial/livevoice-sdk-swift", from: "1.0.0"),
]
```
You can then add the specific product dependency to your target:
```swift
dependencies: [
    .product(name: "LiveVoiceSDK", package: "livevoice-sdk-swift"),
]
```

To show the channels of your event, you can join the event using the `LiveVoice.shared` singleton 
and display the `LiveVoiceView`. 

```swift
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                LiveVoiceView()
                Spacer()
            }
            .task {
                await LiveVoice.shared.joinEvent(
                    joinCode: "123456",
                    password: nil,
                    apiKey: "s09WEG5y3caQ6R2PDaG4i8R1aTooTd"
                )
            }
        }
    }
}
```

For more information on how to use the SDK, see the documentation.
