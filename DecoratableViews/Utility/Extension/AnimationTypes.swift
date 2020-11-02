//
//  AnimationTypes.swift
//  DecoratableViews
//
//  Created by Volkan SÖNMEZ on 2.11.2020.
//

import Foundation

public enum OpeningAnimateType: Int {
    case fromTop
    case fromBottom
    case fromLeft
    case fromRight
    case fadeIn
}

public enum ClosingAnimateType: Int {
    case toTop
    case toBottom
    case toLeft
    case toRight
    case fadeOut
}
