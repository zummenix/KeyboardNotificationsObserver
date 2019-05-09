# KeyboardNotificationsObserver

An observer for `UIKeyboard` notifications that provides a safe and convenient interface.
This is a natural evolution of another my project https://github.com/zummenix/KeyboardWrapper

<img src="https://raw.github.com/zummenix/KeyboardWrapper/master/demo.gif" alt="Demo" width="372" height="662"/>

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
## Requirements

- **iOS 9.0** or higher
- **Xcode 10 (swift 5.0)** or higher

## Changes

Take a look at [change log](CHANGELOG.md).

## Installation

### CocoaPods

KeyboardNotificationsObserver is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'KeyboardNotificationsObserver'
```

### Manual

Just drop the `KeyboardNotificationsObserver.swift` file into your project. That's it!

## License

KeyboardNotificationsObserver is available under the MIT license. See the LICENSE file for more info.
