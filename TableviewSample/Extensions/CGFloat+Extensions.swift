//
//  CGFloat+Extensions.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/03/31.
//

import UIKit

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
