//
//  Keybaord+ToolbarSettings.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation
import UIKit
open class FLBarButtonItem: UIBarButtonItem {

    private static var _classInitialize: Void = classInitialize()

    @objc public override init() {
        _ = FLBarButtonItem._classInitialize
          super.init()
      }

    @objc public required init?(coder aDecoder: NSCoder) {
        _ = FLBarButtonItem._classInitialize
           super.init(coder: aDecoder)
       }

    private class func classInitialize() {

        let  appearanceProxy = self.appearance()

        #if swift(>=4.2)
        typealias UIControlState = UIControl.State
        #endif

        let states: [UIControlState]

        states = [.normal, .highlighted, .disabled, .selected, .application, .reserved]

        for state in states {

            appearanceProxy.setBackgroundImage(nil, for: state, barMetrics: .default)
            appearanceProxy.setBackgroundImage(nil, for: state, style: .done, barMetrics: .default)
            appearanceProxy.setBackgroundImage(nil, for: state, style: .plain, barMetrics: .default)
            appearanceProxy.setBackButtonBackgroundImage(nil, for: state, barMetrics: .default)
        }

        appearanceProxy.setTitlePositionAdjustment(UIOffset(), for: .default)
        appearanceProxy.setBackgroundVerticalPositionAdjustment(0, for: .default)
        appearanceProxy.setBackButtonBackgroundVerticalPositionAdjustment(0, for: .default)
    }

    @objc override open var tintColor: UIColor? {
        didSet {

            #if swift(>=4.2)
            typealias  NSAttributedStringKey = NSAttributedString.Key
            #endif

            #if swift(>=4)
            var textAttributes = [NSAttributedStringKey: Any]()
            let foregroundColorKey = NSAttributedStringKey.foregroundColor
            #else
            var textAttributes = [String: Any]()
            let foregroundColorKey = NSForegroundColorAttributeName
            #endif

            textAttributes[foregroundColorKey] = tintColor

            #if swift(>=4)

                if let attributes = titleTextAttributes(for: .normal) {
                    for (key, value) in attributes {
                        #if swift(>=4.2)
                        textAttributes[key] = value
                        #else
                        textAttributes[NSAttributedStringKey.init(key)] = value
                        #endif
                    }
                }

            #else
                if let attributes = titleTextAttributes(for: .normal) {
                    textAttributes = attributes
                }
            #endif

            setTitleTextAttributes(textAttributes, for: .normal)
        }
    }

    @objc internal var isSystemItem = false


    @objc open func setTarget(_ target: AnyObject?, action: Selector?) {
        if let target = target, let action = action {
            invocation = FLInvocation(target, action)
        } else {
            invocation = nil
        }
    }

    @objc open var invocation: FLInvocation?

    deinit {
        target = nil
        invocation = nil
    }
}

@objc public class FLInvocation: NSObject {
    @objc public weak var target: AnyObject?
    @objc public var action: Selector

    @objc public init(_ target: AnyObject, _ action: Selector) {
        self.target = target
        self.action = action
    }

    @objc public func invoke(from: Any) {
        if let target = target {
            UIApplication.shared.sendAction(action, to: target, from: from, for: UIEvent())
        }
    }

    deinit {
        target = nil
    }
}
