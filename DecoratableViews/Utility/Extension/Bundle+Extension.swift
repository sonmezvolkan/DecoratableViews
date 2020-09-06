//
//  Bundle+Extension.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 4.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation

extension Bundle {
    
    public static func getPodBundle(forClassType: AnyClass) -> Bundle {
        let podBundle = Bundle(for: forClassType)
        let bundleURL = podBundle.url(forResource: "DecoratableViews", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}
