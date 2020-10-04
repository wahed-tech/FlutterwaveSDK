//
//  keyboard+Scrollview.swift
//  FlutterwaveSDK
//
//  Created by Rotimi Joshua on 23/09/2020.
//  Copyright © 2020 Flutterwave. All rights reserved.
//

import Foundation
import UIKit

@objc public extension UIScrollView {

    private struct AssociatedKeys {
        static var shouldIgnoreScrollingAdjustment = "shouldIgnoreScrollingAdjustment"
        static var shouldIgnoreContentInsetAdjustment = "shouldIgnoreContentInsetAdjustment"
        static var shouldRestoreScrollViewContentOffset = "shouldRestoreScrollViewContentOffset"
    }

    /**
     If YES, then scrollview will ignore scrolling (simply not scroll it) for adjusting textfield position. Default is NO.
     */
    var shouldIgnoreScrollingAdjustment: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.shouldIgnoreScrollingAdjustment) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldIgnoreScrollingAdjustment, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     If YES, then scrollview will ignore content inset adjustment (simply not updating it) when keyboard is shown. Default is NO.
     */
    var shouldIgnoreContentInsetAdjustment: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.shouldIgnoreContentInsetAdjustment) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldIgnoreContentInsetAdjustment, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    /**
     To set customized distance from keyboard for textField/textView. Can't be less than zero
     */
    var shouldRestoreScrollViewContentOffset: Bool {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.shouldRestoreScrollViewContentOffset) as? Bool ?? false
        }
        set(newValue) {
            objc_setAssociatedObject(self, &AssociatedKeys.shouldRestoreScrollViewContentOffset, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

internal extension UITableView {

    func previousIndexPath(of indexPath: IndexPath) -> IndexPath? {
        var previousRow = indexPath.row - 1
        var previousSection = indexPath.section

        //Fixing indexPath
        if previousRow < 0 {
            previousSection -= 1
            if previousSection >= 0 {
                previousRow = self.numberOfRows(inSection: previousSection) - 1
            }
        }

        if previousRow >= 0, previousSection >= 0 {
            return IndexPath(row: previousRow, section: previousSection)
        } else {
            return nil
        }
    }
}

internal extension UICollectionView {

    func previousIndexPath(of indexPath: IndexPath) -> IndexPath? {
        var previousRow = indexPath.row - 1
        var previousSection = indexPath.section

        //Fixing indexPath
        if previousRow < 0 {
            previousSection -= 1
            if previousSection >= 0 {
                previousRow = self.numberOfItems(inSection: previousSection) - 1
            }
        }

        if previousRow >= 0, previousSection >= 0 {
            return IndexPath(item: previousRow, section: previousSection)
        } else {
            return nil
        }
    }
}
