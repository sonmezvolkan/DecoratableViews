//
//  UIDevice+Extension.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

extension UIDevice {
    
    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
            let bottom = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
            return bottom > 0
        } else {
            return false
        }
    }
    
    func getTopConstant(for value: CGFloat = 36) -> CGFloat {
        return hasNotch ? value + 20 : value
    }
}
