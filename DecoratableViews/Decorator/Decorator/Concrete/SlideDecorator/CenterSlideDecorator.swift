//
//  CenterSlideDecorator.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 2.11.2020.
//

import Foundation
import UIKit

public class CenterSlideDecorator: DecoratorProtocol {

    public var mainView: UIView?
    
    public var containerView = UIView()
    
    public var shadowView: UIView?
    
    public var alertView: DecoratableViewProtocol?
    
    public var constraintModel: ConstraintModel?
    
    public var animationModel: AnimationModel?
    
    public var createDefaultAnimationModel: (() -> AnimationModel)?
    
    public var onClose: (() -> Void)?
    
    public var closeTappedAround: Bool = false
    
    public var blockUserInteractions: Bool = false
    
    public var closeableZoneRatio: CGFloat = 0.3
    
    public var touchBeganPosition: CGPoint?
    
    public var canMove: Bool = true
    
    public var shadowViewAlphaValue: CGFloat = 0.4
    
    public var radius: CGFloat?
    
    private var isInAnimating: Bool = true
    
    private var topConstraint: NSLayoutConstraint?
    
    private var openingAnimateType: OpeningAnimateType
    
    private var closingAnimateType: ClosingAnimateType
    
    public init() {
        self.openingAnimateType = .fromTop
        self.closingAnimateType = .toBottom
    }
    
    public init(openingAnimateType: OpeningAnimateType, closingAnimateType: ClosingAnimateType) {
        self.openingAnimateType = openingAnimateType
        self.closingAnimateType = closingAnimateType
    }
    
    public func setConstraints() {
        let constraintModel = ConstraintModel.Builder()
            .setCenterYConstraint(constant: 0)
            .setLeadingConstraint(constant: 36)
            .setTrailingCosntraint(constant: 36)
            .build()
        
        setConstraints(constraintModel: constraintModel, selector: #selector(tappedAround))
    }
    
    @objc private func tappedAround() {
        if !closeTappedAround { return }
        closingAnimate()
    }
    
    public func openingAnimate() {
        setOpeningTransform()
        UIView.animate(withDuration: getAnimationModel().animationTime, animations: {
            self.containerView.transform = .identity
        }, completion: { isFinished in
            self.isInAnimating = false
        })
    }
    
    public func closingAnimate() {
        isInAnimating = true
        let transform = getClosingTransform()
        UIView.animate(withDuration: getAnimationModel().animationTime, animations: {
            if let transform = transform {
                self.containerView.transform = transform
            }
        }, completion: { isFinished in
            self.removeViews()
        })
    }
    
    private func setOpeningTransform() {
        switch openingAnimateType {
        case .fromTop:
            containerView.transform = CGAffineTransform(translationX: 0, y: -600)
        case .fromBottom:
            containerView.transform = CGAffineTransform(translationX: 0, y: 600)
        case .fromRight:
            containerView.transform = CGAffineTransform(translationX: 400, y: 0)
        case .fromLeft:
            containerView.transform = CGAffineTransform(translationX: -400, y: 0)
        case .fadeIn:
            containerView.alpha = 0
        }
    }
    
    private func getClosingTransform() -> CGAffineTransform? {
        switch closingAnimateType {
        case .toTop:
            return CGAffineTransform(translationX: 0, y: -600)
        case .toBottom:
            return CGAffineTransform(translationX: 0, y: 600)
        case .toRight:
            return CGAffineTransform(translationX: 400, y: 0)
        case .toLeft:
            return CGAffineTransform(translationX: -400, y: 0)
        case .fadeOut:
            return nil
        }
    }
}
