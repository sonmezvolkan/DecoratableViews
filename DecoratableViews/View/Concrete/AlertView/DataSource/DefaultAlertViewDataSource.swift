//
//  DefaultAlertViewDataSource.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

internal class DefaultAlertViewDataSource {
    
    private let bundle = Bundle.getPodBundle(forClassType: DefaultAlertViewDataSource.self)
    
    public var title: String?
    public var titleFont: UIFont?
    public var titleTextColor: UIColor?
    public var message: String
    public var messageFont: UIFont?
    public var messageTextColor: UIColor?
    public var buttons: [AlertButtonDataSource] = []
    public var axis: NSLayoutConstraint.Axis = .horizontal
    public var image: UIImage?
    public var width = UIScreen.main.bounds.width - 72
    public var alertViewRadius: CGFloat = 24
    public var alertViewBackgroundColor: UIColor = .white
    public var closeButtonVisibe: Bool = false
    public var closeImage: UIImage?

    internal init(title: String?, message: String) {
        self.title = title
        self.message = message
    }
    
    internal func setImage(alertViewType: DefaultAlertView.AlertViewType) {
         switch alertViewType {
         case .success:
            image = UIImage(named: "success", in: bundle, compatibleWith: nil)
         case .failure:
             image = UIImage(named: "failure", in: bundle, compatibleWith: nil)
         case .warning:
             image = UIImage(named: "warning", in: bundle, compatibleWith: nil)
         }
     }
}
