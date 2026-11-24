# Changelog LiveVoice SDK

### 3.0.0 - November 24, 2026

A major release with breaking changes. The
[migration guide](https://github.com/LiveVoiceOfficial/livevoice-sdk-examples/blob/main/ios/MIGRATION.md)
lists every change with before and after code.

- Joining and leaving are awaited: a join returns once the event is ready, and the joined
  event can leave only its own join
- One error type with stable codes and a localized message for every call
- The connection state is observable, with recovery on request
- Playback starts from the channel cells; custom cells and custom loading, reconnecting, error
  and empty views replace the view's state closure
- Password-protected events and channels: a built-in prompt, or your own provider and store
- Audio focus modes for playing alongside other audio, and the playing channel on the Lock
  Screen and in Control Center with your own artwork
- Linked events and language requests for API keys that permit custom UI
- Automatic subtitles that follow the playing channel
- Renamed types and members, among them the audio output, subtitle and channel play state
  types; see the migration guide
- Distributed as a Swift package only; the `LiveVoiceSDK` CocoaPod is no longer published
- Requires Xcode 26.5 or newer (Swift 6.3); the minimum iOS version stays 15

### 2.0.2 - June 26, 2026

- Bugfixes

### 2.0.0 - June 3, 2026

- Updated for LiveVoice 5.0 model changes and UI
- Get derived AI channels per channel

### 1.0.1 - May 13, 2025

- Bugfixes and optimizations

### 1.0.0 - May 1, 2025

- Initial release
