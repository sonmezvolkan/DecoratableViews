//
//  UIViewController+Extension.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    
    public func showDecoratableAlertView(dataSource: DecoratableViewDataSource) {
        DecoratableContext.main.start(controller: self, dataSource: dataSource)
    }
}
