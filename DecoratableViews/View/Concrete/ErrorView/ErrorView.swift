//
//  ErrorView.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

public class ErrorView: UIView, DecoratableViewProtocol {

    public var onClose: (() -> Void)?
    
    public var containerViewBackgroundColor: UIColor? = UIColor(red: 251, green: 51, blue: 51)
    
    public var containerViewAlphaValue: CGFloat?
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var lbl: UILabel!
    
    public init(backgroundColor: UIColor) {
        super.init(frame: .zero)
        self.containerViewBackgroundColor = backgroundColor
        setUp()
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        let bundle = Bundle.getPodBundle(forClassType: NotificationView.self)
        bundle.loadNibNamed("ErrorView", owner: self, options: nil)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        contentView.backgroundColor = containerViewBackgroundColor
        addSubview(contentView)
    }
    
    public override var intrinsicContentSize: CGSize {
        return self.contentView.systemLayoutSizeFitting(self.bounds.size)
    }
    
    public override class var requiresConstraintBasedLayout: Bool {
        return true
    }
    
    public func setErrorMessage(text: String) {
        lbl.text = text
        setNeedsLayout()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        self.translatesAutoresizingMaskIntoConstraints = false
        setNeedsUpdateConstraints()
    }
    
    @IBAction func btnClose(_ sender: Any) {
        onClose?()
    }
}
