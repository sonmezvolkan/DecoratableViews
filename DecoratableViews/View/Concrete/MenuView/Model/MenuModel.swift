//
//  MenuModel.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 6.09.2020.
//  Copyright © 2020 com.volkan.sonmez. All rights reserved.
//

import Foundation

open class MenuModel: Equatable {
    
    public static func == (lhs: MenuModel, rhs: MenuModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    public var id: Int
    
    public var title: String?
    
    public var childs: [MenuModel]?
    
    public init(id: Int) {
        self.id = id
    }
}
