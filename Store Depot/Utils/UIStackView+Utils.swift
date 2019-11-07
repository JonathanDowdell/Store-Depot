//
//  UIStackView+Utils.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/6/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIStackView {
    func addArrangedSubiews(_ views: [UIView]) {
        views.forEach { self.addArrangedSubview($0) }
    }
}
