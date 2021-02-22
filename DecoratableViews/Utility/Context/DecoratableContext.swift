//
//  DecoratableContext.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation
import UIKit

public class DecoratableContext {

    public static let main = DecoratableContext()
    
    private var dataSource: DecoratableViewDataSource?
    private var controller: UIViewController?
    
    private var timer: Timer?
    private var timerIndex = 0
    
    private var mainView: UIView {
        if let tabbar = controller?.tabBarController {
            return tabbar.view
        }
        
        if let navController = controller?.navigationController {
            return navController.view
        }
        
        return controller!.view
    }
    
    public func getDecoratableView() -> DecoratableViewProtocol? {
        guard let dataSource = self.dataSource else { return nil }
        
        return dataSource.decorator.alertView
    }
    
    private init() {
        
    }
    
    public func reset() {
        resetTimer()
        let onAnimationEnd = dataSource?.onAnimationEnd
        dataSource = nil
        controller = nil
        onAnimationEnd?()
    }
    
    public func resetTimer() {
        timerIndex = 0
        timer?.invalidate()
    }
    
    public func start(controller: UIViewController, dataSource: DecoratableViewDataSource) {
        if self.dataSource != nil { return }
        
        resetTimer()
        self.dataSource = dataSource
        self.controller = controller

        setDecorator(dataSource: dataSource)
        setAutoCloseIfNeeded()
    }
    
    public func onTouchesBegan() {
        if dataSource?.renewDurationWhenTouchesBegan ?? false {
            timerIndex = 0
        }
    }
    
    private func setAutoCloseIfNeeded() {
        if let dataSource = self.dataSource, dataSource.autoClose {
            self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.timerClick),
                                              userInfo: nil, repeats: true)
        }
    }
    
    private func setDecorator(dataSource: DecoratableViewDataSource) {
        dataSource.decorator.mainView = mainView
        dataSource.decorator.setConstraints()
        dataSource.decorator.openingAnimate()
    }
    
    @objc private func timerClick() {
        if dataSource?.duration == timerIndex {
            resetTimer()
            dataSource?.decorator.closingAnimate()
        }
        timerIndex += 1
    }
}

