//
//  Keyboard+Dec.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import UIKit
#if swift(>=4.2)
internal let UIKeyboardWillShowNotification  = UIResponder.keyboardWillShowNotification
internal let UIKeyboardDidShowNotification   = UIResponder.keyboardDidShowNotification
internal let UIKeyboardWillHideNotification  = UIResponder.keyboardWillHideNotification
internal let UIKeyboardDidHideNotification   = UIResponder.keyboardDidHideNotification

internal let UIKeyboardAnimationCurveUserInfoKey    = UIResponder.keyboardAnimationCurveUserInfoKey
internal let UIKeyboardAnimationDurationUserInfoKey = UIResponder.keyboardAnimationDurationUserInfoKey
internal let UIKeyboardFrameEndUserInfoKey = UIResponder.keyboardFrameEndUserInfoKey

internal let UITextFieldTextDidBeginEditingNotification  = UITextField.textDidBeginEditingNotification
internal let UITextFieldTextDidEndEditingNotification    = UITextField.textDidEndEditingNotification

internal let UITextViewTextDidBeginEditingNotification   = UITextView.textDidBeginEditingNotification
internal let UITextViewTextDidEndEditingNotification     = UITextView.textDidEndEditingNotification

internal let UIApplicationWillChangeStatusBarOrientationNotification = UIApplication.willChangeStatusBarOrientationNotification

internal let UITextViewTextDidChangeNotification = UITextView.textDidChangeNotification

#else
internal let UIKeyboardWillShowNotification  = Notification.Name.UIKeyboardWillShow
internal let UIKeyboardDidShowNotification   = Notification.Name.UIKeyboardDidShow
internal let UIKeyboardWillHideNotification  = Notification.Name.UIKeyboardWillHide
internal let UIKeyboardDidHideNotification   = Notification.Name.UIKeyboardDidHide

internal let UITextFieldTextDidBeginEditingNotification  = Notification.Name.UITextFieldTextDidBeginEditing
internal let UITextFieldTextDidEndEditingNotification    = Notification.Name.UITextFieldTextDidEndEditing

internal let UITextViewTextDidBeginEditingNotification   = Notification.Name.UITextViewTextDidBeginEditing
internal let UITextViewTextDidEndEditingNotification     = Notification.Name.UITextViewTextDidEndEditing

internal let UIApplicationWillChangeStatusBarOrientationNotification = Notification.Name.UIApplicationWillChangeStatusBarOrientation

internal let UITextViewTextDidChangeNotification = Notification.Name.UITextViewTextDidChange
#endif
