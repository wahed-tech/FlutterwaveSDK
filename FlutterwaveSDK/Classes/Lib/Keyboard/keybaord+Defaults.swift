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
public let fLUseDefaultKeyboardDistance = CGFloat.greatestFiniteMagnitude

/**
UIView category for managing UITextField/UITextView
*/
@objc public extension UIView {

    private struct AssociatedKeys {
        static var fLkeyboardDistanceFromTextField = "fLkeyboardDistanceFromTextField"
        static var fLignoreSwitchingByNextPrevious = "fLignoreSwitchingByNextPrevious"
        static var fLenableMode = "fLenableMode"
        static var fLshouldResignOnTouchOutsideMode = "fLshouldResignOnTouchOutsideMode"
    }

    /**
     To set customized distance from keyboard for textField/textView. Can't be less than zero
     */
    var fLkeyboardDistanceFromTextField: CGFloat {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fLkeyboardDistanceFromTextField) as? CGFloat ?? fLUseDefaultKeyboardDistance
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fLkeyboardDistanceFromTextField, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     If shouldIgnoreSwitchingByNextPrevious is true then library will ignore this textField/textView while moving to other textField/textView using keyboard toolbar next previous buttons. Default is false
     */
    var fLignoreSwitchingByNextPrevious: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fLignoreSwitchingByNextPrevious) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fLignoreSwitchingByNextPrevious, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     Override Enable/disable managing distance between keyboard and textField behaviour for this particular textField.
     */
    var enableMode: FLEnableMode {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fLenableMode) as? FLEnableMode ?? .default
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fLenableMode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     Override resigns Keyboard on touching outside of UITextField/View behaviour for this particular textField.
     */
    var shouldResignOnTouchOutsideMode: FLEnableMode {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.fLshouldResignOnTouchOutsideMode) as? FLEnableMode ?? .default
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.fLshouldResignOnTouchOutsideMode, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
