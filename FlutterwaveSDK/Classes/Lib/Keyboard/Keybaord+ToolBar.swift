//
//  Keybaord+ToolBar.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation

// MARK: IQAutoToolbarManageBehaviour

/**
`IQAutoToolbarBySubviews`
Creates Toolbar according to subview's hirarchy of Textfield's in view.

`IQAutoToolbarByTag`
Creates Toolbar according to tag property of TextField's.

`IQAutoToolbarByPosition`
Creates Toolbar according to the y,x position of textField in it's superview coordinate.
*/
@objc public enum IQAutoToolbarManageBehaviour: Int {
    case bySubviews
    case byTag
    case byPosition
}

/**
 `IQPreviousNextDisplayModeDefault`
 Show NextPrevious when there are more than 1 textField otherwise hide.
 
 `IQPreviousNextDisplayModeAlwaysHide`
 Do not show NextPrevious buttons in any case.
 
 `IQPreviousNextDisplayModeAlwaysShow`
 Always show nextPrevious buttons, if there are more than 1 textField then both buttons will be visible but will be shown as disabled.
 */
@objc public enum IQPreviousNextDisplayMode: Int {
    case `default`
    case alwaysHide
    case alwaysShow
}

/**
 `IQEnableModeDefault`
 Pick default settings.
 
 `IQEnableModeEnabled`
 setting is enabled.
 
 `IQEnableModeDisabled`
 setting is disabled.
 */
@objc public enum IQEnableMode: Int {
    case `default`
    case enabled
    case disabled
}

/*
 /---------------------------------------------------------------------------------------------------\
 \---------------------------------------------------------------------------------------------------/
 |                                   iOS Notification Mechanism                                    |
 /---------------------------------------------------------------------------------------------------\
 \---------------------------------------------------------------------------------------------------/
 
 ------------------------------------------------------------
 When UITextField become first responder
 ------------------------------------------------------------
 - UITextFieldTextDidBeginEditingNotification (UITextField)
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When UITextView become first responder
 ------------------------------------------------------------
 - UIKeyboardWillShowNotification
 - UITextViewTextDidBeginEditingNotification (UITextView)
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When switching focus from UITextField to another UITextField
 ------------------------------------------------------------
 - UITextFieldTextDidEndEditingNotification (UITextField1)
 - UITextFieldTextDidBeginEditingNotification (UITextField2)
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When switching focus from UITextView to another UITextView
 ------------------------------------------------------------
 - UITextViewTextDidEndEditingNotification: (UITextView1)
 - UIKeyboardWillShowNotification
 - UITextViewTextDidBeginEditingNotification: (UITextView2)
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When switching focus from UITextField to UITextView
 ------------------------------------------------------------
 - UITextFieldTextDidEndEditingNotification (UITextField)
 - UIKeyboardWillShowNotification
 - UITextViewTextDidBeginEditingNotification (UITextView)
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When switching focus from UITextView to UITextField
 ------------------------------------------------------------
 - UITextViewTextDidEndEditingNotification (UITextView)
 - UITextFieldTextDidBeginEditingNotification (UITextField)
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 When opening/closing UIKeyboard Predictive bar
 ------------------------------------------------------------
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 
 ------------------------------------------------------------
 On orientation change
 ------------------------------------------------------------
 - UIApplicationWillChangeStatusBarOrientationNotification
 - UIKeyboardWillHideNotification
 - UIKeyboardDidHideNotification
 - UIApplicationDidChangeStatusBarOrientationNotification
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 - UIKeyboardWillShowNotification
 - UIKeyboardDidShowNotification
 
 */


import UIKit

@objc public extension UIViewController {

    private struct AssociatedKeys {
        static var IQLayoutGuideConstraint = "IQLayoutGuideConstraint"
    }

    /**
     This method is provided to override by viewController's if the library lifts a viewController which you doesn't want to lift . This may happen if you have implemented side menu feature in your app and the library try to lift the side menu controller. Overriding this method in side menu class to return correct controller should fix the problem.
    */
    func parentIQContainerViewController() -> UIViewController? {
        return self
    }

    /**
    To set customized distance from keyboard for textField/textView. Can't be less than zero
     
     @deprecated    Due to change in core-logic of handling distance between textField and keyboard distance, this layout contraint tweak is no longer needed and things will just work out of the box regardless of constraint pinned with safeArea/layoutGuide/superview
    */
    @available(*, deprecated, message: "Due to change in core-logic of handling distance between textField and keyboard distance, this layout contraint tweak is no longer needed and things will just work out of the box regardless of constraint pinned with safeArea/layoutGuide/superview.")
    @IBOutlet var IQLayoutGuideConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.IQLayoutGuideConstraint) as? NSLayoutConstraint
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.IQLayoutGuideConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
