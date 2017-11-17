//
//  UIView+Utils.swift
//  PlayerStat
//
//  Created by Le Thanh Hai on 11/17/17.
//  Copyright © 2017 haile. All rights reserved.
//

import UIKit

extension UIView {
    public var widthContraint: NSLayoutConstraint? {
        for constraint in self.constraints {
            if let firstItem = constraint.firstItem, constraint.firstAttribute == NSLayoutAttribute.width && firstItem.isEqual(self) {
                if object_getClassName(constraint) == object_getClassName(NSLayoutConstraint.self) {
                    return constraint
                }
            }
        }
        return nil
    }
    
    public var heightContraint: NSLayoutConstraint? {
        for constraint in self.constraints {
            if let firstItem = constraint.firstItem, constraint.firstAttribute == NSLayoutAttribute.height && firstItem.isEqual(self) {
                if object_getClassName(constraint) == object_getClassName(NSLayoutConstraint.self) {
                    return constraint
                }
            }
        }
        return nil
    }
    
    public func commonSuperview(with view: UIView) -> UIView? {
        var commonSuperview: UIView?
        var startView: UIView? = self
        repeat {
            if view.isDescendant(of: startView!) {
                commonSuperview = startView
            }
            startView = startView!.superview
        } while startView != nil && commonSuperview == nil
        return commonSuperview
    }
    
    // MARK: - Edge constrains
    public func edgeContraint(attribute: NSLayoutAttribute) -> NSLayoutConstraint? {
        var superview: UIView? = self.superview
        while superview != nil {
            for constraint in superview!.constraints {
                if let firstItem = constraint.firstItem, constraint.firstAttribute == attribute && firstItem.isEqual(self) {
                    return constraint
                }
            }
            superview = superview!.superview
        }
        return nil
    }
    
    public var leftEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .left)
    }
    
    public var rightEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .right)
    }
    
    public var topEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .top)
    }
    
    public var bottomEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .bottom)
    }
    
    public var leadingEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .leading)
    }
    
    public var trailingEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .trailing)
    }
    
    public var centerXEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .centerX)
    }
    
    public var centerYEdgeConstraint: NSLayoutConstraint? {
        return self.edgeContraint(attribute: .centerY)
    }
}

extension NSLayoutConstraint {
    public func remove() {
        if let firstItem = self.firstItem as? UIView {
            if let secondItem = self.secondItem as? UIView {
                var commonSuperview = firstItem.commonSuperview(with: secondItem)
                while commonSuperview != nil {
                    if commonSuperview!.constraints.contains(self) {
                        commonSuperview!.removeConstraint(self)
                        return
                    }
                    commonSuperview = commonSuperview!.superview
                }
            } else {
                firstItem.removeConstraint(self)
            }
        }
    }
}

