//
//  UIViewExtension.swift
//  travmedic
//
//  Created by Marcus on 03.01.18.
//  Copyright © 2018 Marcus Hopp. All rights reserved.
//

import UIKit

extension UIView {
    func add(_ subViews: UIView...) {
        subViews.forEach(addSubview)
    }
}
