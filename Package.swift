// swift-tools-version:5.0
import PackageDescription

let package = Package(
    name: "KeyboardNotificationsObserver",
    platforms: [ .iOS(.v12) ],
    products: [
        .library(
            name: "KeyboardNotificationsObserver",
            targets: ["KeyboardNotificationsObserver"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KeyboardNotificationsObserver",
            dependencies: []),
    ]
)
