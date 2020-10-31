//
//  Keybaord+ToolBar.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation

@objc public enum FLAutoToolbarManageBehaviour: Int {
    case bySubviews
    case byTag
    case byPosition
}

@objc public enum FLPreviousNextDisplayMode: Int {
    case `default`
    case alwaysHide
    case alwaysShow
}


@objc public enum FLEnableMode: Int {
    case `default`
    case enabled
    case disabled
}



import UIKit

@objc public extension UIViewController {

    private struct AssociatedKeys {
        static var FLLayoutGuideConstraint = "FLLayoutGuideConstraint"
    }

    func parentIQContainerViewController() -> UIViewController? {
        return self
    }

    @available(*, deprecated, message: "Due to change in core-logic of handling distance between textField and keyboard distance, this layout contraint tweak is no longer needed and things will just work out of the box regardless of constraint pinned with safeArea/layoutGuide/superview.")
    @IBOutlet var IQLayoutGuideConstraint: NSLayoutConstraint? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.FLLayoutGuideConstraint) as? NSLayoutConstraint
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.FLLayoutGuideConstraint, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}
