//
//  DecoratableAlertViewDataSource.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

public class DecoratableViewDataSource {
    
    public let decorator: DecoratorProtocol!
    public let autoClose: Bool!
    public var duration: Int!
    public var renewDurationWhenTouchesBegan: Bool!
    public var superViewBackgroundColor: UIColor!
    public var onAnimationStart: (() -> Void)?
    public var onAnimationEnd: (() -> Void)?
    
    fileprivate init(decorator: DecoratorProtocol,
                     autoClose: Bool,
                     duration: Int,
                     renewDurationWhenTouchesBegan: Bool,
                     superViewBackgroundColor: UIColor,
                     onAnimationStart: (() -> Void)?,
                     onAnimationEnd: (() -> Void)?) {
        self.decorator = decorator
        self.autoClose = autoClose
        self.duration = duration
        self.renewDurationWhenTouchesBegan = renewDurationWhenTouchesBegan
        self.superViewBackgroundColor = superViewBackgroundColor
        self.onAnimationStart = onAnimationStart
        self.onAnimationEnd = onAnimationEnd
    }

    public class Builder {
        
        private var alertDecorator: DecoratorProtocol
        private var autoClose: Bool = false
        private var duration: Int = 15
        private var renewDurationWhenTouchesBegan: Bool = false
        private var superViewBackgroundColor: UIColor = .clear
        public var onAnimationStart: (() -> Void)?
        public var onAnimationEnd: (() -> Void)?
        
        public init(view: DecoratableViewProtocol,
                    alertDecorator: DecoratorProtocol) {
            self.alertDecorator = alertDecorator
            self.alertDecorator.alertView = view
            
            self.alertDecorator.createAnimationModelInstance()
        }
        
        internal init(alertView: DecoratableViewProtocol,
                    alertDecorator: DecoratorProtocol,
                    withDefaultAnimationInstance: Bool) {
            self.alertDecorator = alertDecorator
            self.alertDecorator.alertView = alertView
            
            if withDefaultAnimationInstance {
                self.alertDecorator.createAnimationModelInstance()
            }
        }
        
        @discardableResult
        public func setAutoCloseEnabled(enabled: Bool) -> Builder {
            self.autoClose = enabled
            return self
        }
        
        @discardableResult
        public func setDuration(duration: Int) -> Builder {
            self.autoClose = true
            self.duration = duration
            return self
        }
        
        @discardableResult
        public func setRenewDurationWhenTouchesBegan(enabled: Bool) -> Builder {
            self.renewDurationWhenTouchesBegan = enabled
            return self
        }
        
        @discardableResult
        public func setCloseTappedAround(isEnabled: Bool) -> Builder {
            self.alertDecorator.closeTappedAround = isEnabled
            self.alertDecorator.blockUserInteractions = true
            return self
        }
        
        @discardableResult
        public func setBlockUserInteractions(isEnabled: Bool) -> Builder {
            self.alertDecorator.blockUserInteractions = isEnabled
            return self
        }
        
        @discardableResult
        public func setShadowViewAlphaValue(value: CGFloat) -> Builder {
            self.alertDecorator.shadowViewAlphaValue = value
            return self
        }

        @discardableResult
        public func setClosableZoneRatio(ratio: CGFloat) -> Builder {
            if ratio <= 0 || ratio > 1 { fatalError("Ratio can not be 0 and higher than 1") }
            self.alertDecorator.closeableZoneRatio = ratio
            return self
        }
        
        @discardableResult
        public func setSuperViewBackgroundColor(color: UIColor) -> Builder {
            self.superViewBackgroundColor = color
            return self
        }
        
        @discardableResult
        public func setAnimationTime(animationTime: TimeInterval) -> Builder {
            self.alertDecorator.animationModel?.animationTime = animationTime
            return self
        }
        
        @discardableResult
        public func setAnimationDelay(delay: TimeInterval) -> Builder {
            self.alertDecorator.animationModel?.delay = delay
            return self
        }
        
        @discardableResult
        public func setUsingSpringWithDamping(ratio: CGFloat) -> Builder {
            self.alertDecorator.animationModel?.usingSpringWithDamping = ratio
            return self
        }
        
        @discardableResult
        public func setInitialSpringVelocity(value: CGFloat) -> Builder {
            self.alertDecorator.animationModel?.initialSpringVelocity = value
            return self
        }
        
        @discardableResult
        public func setAnimationOptions(options: UIView.AnimationOptions) -> Builder {
            self.alertDecorator.animationModel?.options = options
            return self
        }
        
        @discardableResult
        public func setCanMove(canMove: Bool) -> Builder {
            self.alertDecorator.canMove = canMove
            return self
        }
        
        @discardableResult
        public func setRadius(radius: CGFloat) -> Builder {
            self.alertDecorator.radius = radius
            return self
        }
        
        @discardableResult
        public func setOnAnimationStart(onAnimationStart: (() -> Void)?) -> Builder {
            self.onAnimationStart = onAnimationStart
            return self
        }
        
        @discardableResult
        public func setOnAnimationEnd(onAnimationEnd: (() -> Void)?) -> Builder {
            self.onAnimationEnd = onAnimationEnd
            return self
        }

        public func getDataSource() -> DecoratableViewDataSource {
            return DecoratableViewDataSource(decorator: alertDecorator,
                                                  autoClose: autoClose,
                                                  duration: duration,
                                                  renewDurationWhenTouchesBegan: renewDurationWhenTouchesBegan,
                                                  superViewBackgroundColor: superViewBackgroundColor,
                                                  onAnimationStart: onAnimationStart,
                                                  onAnimationEnd: onAnimationEnd)
        }
        
        public func show() {
            guard let controller = UIApplication.getTopMostViewController() else { return }
            
            controller.showDecoratableAlertView(dataSource: getDataSource())
        }
    }
}
