//
//  UIImageViewDarkOverlay.swift
//  AtomuzSports
//
//  Created by Joan Wilson Oliveira on 14/10/22.
//

import Foundation
import UIKit

extension UIView {
    func darkOverlay(color: UIColor = .black,alpha : CGFloat = 0.6) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        addSubview(overlay)
    }
}
