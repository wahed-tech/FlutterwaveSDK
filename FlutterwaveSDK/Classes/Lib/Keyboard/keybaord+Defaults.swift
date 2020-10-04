//
//  keybaord+Defaults.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//


import Foundation
import UIKit

/**
Uses default keyboard distance for textField.
*/
public let kIQUseDefaultKeyboardDistance = CGFloat.greatestFiniteMagnitude

/**
UIView category for managing UITextField/UITextView
*/
@objc public extension UIView {

    private struct AssociatedKeys {
        static var keyboardDistanceFromTextField = "keyboardDistanceFromTextField"
        static var ignoreSwitchingByNextPrevious = "ignoreSwitchingByNextPrevious"
        static var enableMode = "enableMode"
        static var shouldResignOnTouchOutsideMode = "shouldResignOnTouchOutsideMode"
    }

    /**
     To set customized distance from keyboard for textField/textView. Can't be less than zero
     */
    var keyboardDistanceFromTextField: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.keyboardDistanceFromTextField) as? CGFloat ?? kIQUseDefaultKeyboardDistance
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.keyboardDistanceFromTextField, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     If shouldIgnoreSwitchingByNextPrevious is true then library will ignore this textField/textView while moving to other textField/textView using keyboard toolbar next previous buttons. Default is false
     */
    var ignoreSwitchingByNextPrevious: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.ignoreSwitchingByNextPrevious) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.ignoreSwitchingByNextPrevious, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     Override Enable/disable managing distance between keyboard and textField behaviour for this particular textField.
     */
    var enableMode: IQEnableMode {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.enableMode) as? IQEnableMode ?? .default
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.enableMode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     Override resigns Keyboard on touching outside of UITextField/View behaviour for this particular textField.
     */
    var shouldResignOnTouchOutsideMode: IQEnableMode {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.shouldResignOnTouchOutsideMode) as? IQEnableMode ?? .default
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldResignOnTouchOutsideMode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
