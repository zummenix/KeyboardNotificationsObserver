# KeyboardNotificationsObserver

[![Build Status](https://travis-ci.com/zummenix/KeyboardNotificationsObserver.svg?branch=master)](https://travis-ci.com/zummenix/KeyboardNotificationsObserver)

An observer for `UIKeyboard` notifications that provides a safe and convenient interface.

<img src="https://raw.github.com/zummenix/KeyboardNotificationsObserver/master/demo.gif" alt="Demo" width="372" height="662"/>

## Usage

- Import module
```Swift
import KeyboardNotificationsObserver
```

- Create `KeyboardNotificationsObserver` instance as a property (for example on a view controller)
```Swift
private let keyboardObserver = KeyboardNotificationsObserver()
```

- Implement necessary callbacks
```Swift
override func viewDidLoad() {
    super.viewDidLoad()
    keyboardObserver.onWillShow = { [weak self] info in
        // Change a view according to keyboard size.
    }
}
```

All six UIKeyboard notifications are implemented. You can use the following callbacks:
`onWillShow`, `onDidShow`, `onWillHide`, `onDidHide`, `onWillChangeFrame`, `onDidChangeFrame`

## Requirements

- **iOS 9.0** or higher
- **Xcode 11 (swift 5.0)** or higher

## Changes

Take a look at [change log](CHANGELOG.md).

## Installation

### SwiftPM

Use Swift Package Manager integration in Xcode to add this dependency.

### Manual

Just drop the `KeyboardNotificationsObserver.swift` file into your project. That's it!

## License

KeyboardNotificationsObserver is available under the MIT license. See the LICENSE file for more info.
