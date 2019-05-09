//
//  ViewController.swift
//  KeyboardNotificationsObserver
//
//  Created by zummenix on 05/09/2019.
//  Copyright (c) 2019 zummenix. All rights reserved.
//

import UIKit
import KeyboardNotificationsObserver

class ViewController: UIViewController {

    @IBOutlet private var bottomConstraint: NSLayoutConstraint!

    private let keyboardObserver = KeyboardNotificationsObserver()

    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardObserver.onWillShow = { [weak self] info in
            self?.handleKeyboardAppearance(height: info.endFrame.size.height)
        }
        keyboardObserver.onWillHide = { [weak self] _ in
            self?.handleKeyboardAppearance(height: 0.0)
        }
    }

    private func handleKeyboardAppearance(height: CGFloat) {
        bottomConstraint.constant = height
        view.layoutIfNeeded()
    }

    @IBAction func tapGestureRecognizerAction(_ sender: UIGestureRecognizer) {
        view.endEditing(true)
    }
}
