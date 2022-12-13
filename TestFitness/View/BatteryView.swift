//
//  BatteryView.swift
//  FitnessEMS
//
//  Created by Ruslan Dalgatov on 11.10.2022.
//

import Foundation
import UIKit

class BatteryView: UIView {
    
    private let percentLabel: UILabel = {
        $0.font = UIFont(name: "Avenir Next", size: 18)
        $0.textColor = .black
        $0.textAlignment = .right
        
        return $0
    }(UILabel())
    
    private let batteryImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        
        return $0
    }(UIImageView())

    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Interface
    
    func configure(percent: Int, image: UIImage) {
        percentLabel.text = "\(percent)%"
        batteryImage.image = image
    }
    
    // MARK: - Setup
    
    private func setupSubviews() {
        addSubviews(percentLabel, batteryImage)
        
        [percentLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
         percentLabel.topAnchor.constraint(equalTo: topAnchor),
         percentLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
         
         batteryImage.leadingAnchor.constraint(equalTo: leadingAnchor),
         batteryImage.topAnchor.constraint(equalTo: topAnchor),
         batteryImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ].forEach { $0.isActive = true }
    }
}
