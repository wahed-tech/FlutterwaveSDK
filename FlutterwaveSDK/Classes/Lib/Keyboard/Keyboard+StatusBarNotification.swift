//
//  Keyboard+StatusBarNotification.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation
import UIKit
internal extension FLKeyboardManager {

    /**  UIApplicationWillChangeStatusBarOrientationNotification. Need to set the textView to it's original position. If any frame changes made. (Bug ID: #92)*/
    @objc func willChangeStatusBarOrientation(_ notification: Notification) {

        let currentStatusBarOrientation: UIInterfaceOrientation
        #if swift(>=5.1)
        if #available(iOS 13, *) {
            currentStatusBarOrientation = keyWindow()?.windowScene?.interfaceOrientation ?? UIInterfaceOrientation.unknown
        } else {
            currentStatusBarOrientation = UIApplication.shared.statusBarOrientation
        }
        #else
        currentStatusBarOrientation = UIApplication.shared.statusBarOrientation
        #endif

        #if swift(>=4.2)
        let UIApplicationStatusBarOrientationUserInfoKey = UIApplication.statusBarOrientationUserInfoKey
        #endif

        guard let statusBarOrientation = notification.userInfo?[UIApplicationStatusBarOrientationUserInfoKey] as? Int, currentStatusBarOrientation.rawValue != statusBarOrientation else {
            return
        }

        let startTime = CACurrentMediaTime()
        showLog("****** \(#function) started ******", indentation: 1)

        //If textViewContentInsetChanged is saved then restore it.
        if let textView = textFieldView as? UITextView, textView.responds(to: #selector(getter: UITextView.isEditable)) {

            if isTextViewContentInsetChanged {
                self.isTextViewContentInsetChanged = false
                if textView.contentInset != self.startingTextViewContentInsets {
                    UIView.animate(withDuration: animationDuration, delay: 0, options: animationCurve, animations: { () -> Void in

                        self.showLog("Restoring textView.contentInset to: \(self.startingTextViewContentInsets)")

                        //Setting textField to it's initial contentInset
                        textView.contentInset = self.startingTextViewContentInsets
                        textView.scrollIndicatorInsets = self.startingTextViewScrollIndicatorInsets

                    }, completion: { (_) -> Void in })
                }
            }
        }

        restorePosition()

        let elapsedTime = CACurrentMediaTime() - startTime
        showLog("****** \(#function) ended: \(elapsedTime) seconds ******", indentation: -1)
    }
}
