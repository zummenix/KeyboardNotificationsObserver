// https://github.com/Quick/Quick

import Quick
import Nimble
import KeyboardNotificationsObserver

class Spec: QuickSpec {
    override func spec() {
        describe("UserInfo decoding") {

            it("can decode animation curve") {
                let expectedCurves: [UIView.AnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

                let curves = expectedCurves.map { c -> UIView.AnimationCurve in
                    let info = [UIResponder.keyboardAnimationCurveUserInfoKey: c.rawValue]
                    return KeyboardNotificationsObserver.UserInfo(info: info, notificationType: .willShow).animationCurve
                }
                expect(curves) == expectedCurves
            }

            it("can decode animation options") {
                let curves: [UIView.AnimationCurve] = [.easeInOut, .easeIn, .easeOut, .linear]

                let options = curves.map { c -> UIView.AnimationOptions in
                    let info = [UIResponder.keyboardAnimationCurveUserInfoKey: c.rawValue]
                    return KeyboardNotificationsObserver.UserInfo(info: info, notificationType: .willShow).animationOptions
                }
                expect(options) == [.curveEaseInOut, .curveEaseIn, .curveEaseOut, .curveLinear]
            }

            it("can decode animation options with raw value 7 for the animation curve") {
                let info = [UIResponder.keyboardAnimationCurveUserInfoKey: 7]
                let userInfo = KeyboardNotificationsObserver.UserInfo(info: info, notificationType: .willShow)
                expect(userInfo.animationOptions.rawValue) == 458752
            }

            it("can decode is local flag") {
                let info = [UIResponder.keyboardIsLocalUserInfoKey: true]
                let userInfo = KeyboardNotificationsObserver.UserInfo(info: info, notificationType: .willShow)
                expect(userInfo.isLocal) == true
            }
        }

        describe("Observing Notifications") {

            it("can observe all keyboard notifications") {
                var receivedNotificationTypes: [KeyboardNotificationsObserver.NotificationType] = []
                let observer = KeyboardNotificationsObserver()
                let closure: (KeyboardNotificationsObserver.UserInfo) -> Void = { info in
                    receivedNotificationTypes.append(info.notificationType)
                }
                observer.onWillShow = closure
                observer.onDidShow = closure
                observer.onWillHide = closure
                observer.onDidHide = closure
                observer.onWillChangeFrame = closure
                observer.onDidChangeFrame = closure

                let notificationTypes: [KeyboardNotificationsObserver.NotificationType] =
                    [.willShow, .didShow, .willHide, .didHide, .willChangeFrame, .didChangeFrame]
                for type in notificationTypes {
                    NotificationCenter.default.post(name: type.name, object: nil)
                }

                expect(receivedNotificationTypes) == notificationTypes
            }

            it("can observe only keyboard notifications that have a related callback") {
                var receivedNotificationTypes: [KeyboardNotificationsObserver.NotificationType] = []
                let observer = KeyboardNotificationsObserver()
                let closure: (KeyboardNotificationsObserver.UserInfo) -> Void = { info in
                    receivedNotificationTypes.append(info.notificationType)
                }
                observer.onWillShow = closure
                observer.onWillChangeFrame = closure

                let notificationTypes: [KeyboardNotificationsObserver.NotificationType] =
                    [.willShow, .didShow, .willHide, .didHide, .willChangeFrame, .didChangeFrame]
                for type in notificationTypes {
                    NotificationCenter.default.post(name: type.name, object: nil)
                }

                expect(receivedNotificationTypes) == [.willShow, .willChangeFrame]
            }

            it("can not observe any notifications after setting callback to nil") {
                var receivedNotificationTypes: [KeyboardNotificationsObserver.NotificationType] = []
                let observer = KeyboardNotificationsObserver()
                let closure: (KeyboardNotificationsObserver.UserInfo) -> Void = { info in
                    receivedNotificationTypes.append(info.notificationType)
                }
                observer.onWillShow = closure
                observer.onDidShow = closure
                observer.onWillHide = closure
                observer.onDidHide = closure
                observer.onWillChangeFrame = closure
                observer.onDidChangeFrame = closure

                observer.onWillShow = nil
                observer.onDidShow = nil
                observer.onWillHide = nil
                observer.onDidHide = nil
                observer.onWillChangeFrame = nil
                observer.onDidChangeFrame = nil

                let notificationTypes: [KeyboardNotificationsObserver.NotificationType] =
                    [.willShow, .didShow, .willHide, .didHide, .willChangeFrame, .didChangeFrame]
                for type in notificationTypes {
                    NotificationCenter.default.post(name: type.name, object: nil)
                }

                expect(receivedNotificationTypes) == []
            }

            it("can not observe duplicates") {
                var firstReceivedNotificationTypes: [KeyboardNotificationsObserver.NotificationType] = []
                var secondReceivedNotificationTypes: [KeyboardNotificationsObserver.NotificationType] = []
                let observer = KeyboardNotificationsObserver()
                let firstClosure: (KeyboardNotificationsObserver.UserInfo) -> Void = { info in
                    firstReceivedNotificationTypes.append(info.notificationType)
                }
                let secondClosure: (KeyboardNotificationsObserver.UserInfo) -> Void = { info in
                    secondReceivedNotificationTypes.append(info.notificationType)
                }
                observer.onWillShow = firstClosure
                observer.onDidShow = firstClosure
                observer.onWillHide = firstClosure
                observer.onDidHide = firstClosure
                observer.onWillChangeFrame = firstClosure
                observer.onDidChangeFrame = firstClosure

                observer.onWillShow = secondClosure
                observer.onDidShow = secondClosure
                observer.onWillHide = secondClosure
                observer.onDidHide = secondClosure
                observer.onWillChangeFrame = secondClosure
                observer.onDidChangeFrame = secondClosure

                let notificationTypes: [KeyboardNotificationsObserver.NotificationType] =
                    [.willShow, .didShow, .willHide, .didHide, .willChangeFrame, .didChangeFrame]
                for type in notificationTypes {
                    NotificationCenter.default.post(name: type.name, object: nil)
                }

                expect(firstReceivedNotificationTypes) == []
                expect(secondReceivedNotificationTypes) == notificationTypes
            }
        }
    }
}
