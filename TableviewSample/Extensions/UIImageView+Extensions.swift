//
//  UIImageView+Extensions.swift
//  TableviewSample
//
//  Created by xuanquynhle on 2021/03/31.
//

import UIKit

extension UIImageView {
  func setImageColor(color: UIColor) {
    let templateImage = self.image?.withRenderingMode(.alwaysTemplate)
    self.image = templateImage
    self.tintColor = color
  }
}
