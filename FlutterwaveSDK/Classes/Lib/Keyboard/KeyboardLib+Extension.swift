//
//  KeyboardLib+Extension.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation
import UIKit
// MARK: Debugging & Developer options
public extension IQKeyboardManager {

    private struct AssociatedKeys {
        static var enableDebugging = "enableDebugging"
    }

    @objc var enableDebugging: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.enableDebugging) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.enableDebugging, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     @warning Use below methods to completely enable/disable notifications registered by library internally.
     Please keep in mind that library is totally dependent on NSNotification of UITextField, UITextField, Keyboard etc.
     If you do unregisterAllNotifications then library will not work at all. You should only use below methods if you want to completedly disable all library functions.
     You should use below methods at your own risk.
     */
    @objc func registerAllNotifications() {

        //  Registering for keyboard notification.
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIKeyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidShow(_:)), name: UIKeyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIKeyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardDidHide(_:)), name: UIKeyboardDidHideNotification, object: nil)

        //  Registering for UITextField notification.
        registerTextFieldViewClass(UITextField.self, didBeginEditingNotificationName: UITextFieldTextDidBeginEditingNotification.rawValue, didEndEditingNotificationName: UITextFieldTextDidEndEditingNotification.rawValue)

        //  Registering for UITextView notification.
        registerTextFieldViewClass(UITextView.self, didBeginEditingNotificationName: UITextViewTextDidBeginEditingNotification.rawValue, didEndEditingNotificationName: UITextViewTextDidEndEditingNotification.rawValue)

        //  Registering for orientation changes notification
        NotificationCenter.default.addObserver(self, selector: #selector(self.willChangeStatusBarOrientation(_:)), name: UIApplicationWillChangeStatusBarOrientationNotification, object: UIApplication.shared)
    }

    @objc func unregisterAllNotifications() {

        //  Unregistering for keyboard notification.
        NotificationCenter.default.removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIKeyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIKeyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIKeyboardDidHideNotification, object: nil)

        //  Unregistering for UITextField notification.
        unregisterTextFieldViewClass(UITextField.self, didBeginEditingNotificationName: UITextFieldTextDidBeginEditingNotification.rawValue, didEndEditingNotificationName: UITextFieldTextDidEndEditingNotification.rawValue)

        //  Unregistering for UITextView notification.
        unregisterTextFieldViewClass(UITextView.self, didBeginEditingNotificationName: UITextViewTextDidBeginEditingNotification.rawValue, didEndEditingNotificationName: UITextViewTextDidEndEditingNotification.rawValue)

        //  Unregistering for orientation changes notification
        NotificationCenter.default.removeObserver(self, name: UIApplicationWillChangeStatusBarOrientationNotification, object: UIApplication.shared)
    }

    internal func showLog(_ logString: String, indentation: Int = 0) {

        guard enableDebugging else {
            return
        }

        struct Static {
            static var indentation = 0
        }

        if indentation < 0 {
            Static.indentation = max(0, Static.indentation + indentation)
        }

        var preLog = "IQKeyboardManager"
        for _ in 0 ... Static.indentation {
            preLog += "|\t"
        }

//        print(preLog + logString)

        if indentation > 0 {
            Static.indentation += indentation
        }
    }
}
