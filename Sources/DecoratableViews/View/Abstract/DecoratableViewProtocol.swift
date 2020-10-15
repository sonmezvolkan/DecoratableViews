//
//  AlertViewProtocol.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

public protocol DecoratableViewProtocol where Self: UIView {
    
    var onClose: (() -> Void)? { get set }
    
    var containerViewBackgroundColor: UIColor? { get set }
    
    var containerViewAlphaValue: CGFloat? { get set }
}

extension DecoratableViewProtocol {
    func resizeView() {
        setNeedsLayout()
        setNeedsUpdateConstraints()
    }
}
