//
//  UIColor+Extensions.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/03/31.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
