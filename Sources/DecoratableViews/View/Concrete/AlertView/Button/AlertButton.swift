//
//  AlertButton.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

internal class AlertButton: UIButton {
    
    private let source: AlertButtonDataSource
    public var onDidTap: (() -> Void)?
    
    internal init(source: AlertButtonDataSource) {
        self.source = source
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setContents()
    }
    
    private func setContents() {
        setTitle(source.title, for: .normal)
        setTitleColor(source.buttonTextColor, for: .normal)
        backgroundColor = source.buttonBackgroundColor
        layer.cornerRadius = source.buttonRadius
        clipsToBounds = true
        addTarget(self, action: #selector(self.onButtonDidTap), for: .touchUpInside)
    }
    
    @objc private func onButtonDidTap() {
        self.source.onDidTap()
        onDidTap?()
    }
}
