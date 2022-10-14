//
//  UIV.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 14.10.2022.
//

import Foundation
import UIKit

extension UIView {
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            self.addSubview($0)
        }
    }
}


