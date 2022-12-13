//
//  SliderView.swift
//  FitnessEMS
//
//  Created by Ruslan Dalgatov on 11.10.2022.
//

import Foundation
import UIKit

class SliderView: UIView {
    
    var onCurrentValue: ((Int) -> Void)?
    
    private var initialValue: Int? {
        didSet {
            slider.setValue(Float(initialValue!), animated: false)
        }
    }
    
    private(set) lazy var nameLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont(name: "Avenir Next Medium", size: 16)
        
        return $0
    }(UILabel())
    
    private lazy var minLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = UIFont(name: "Avenir Next", size: 16)
        $0.text = "0"
        
        return $0
    }(UILabel())
    
    private lazy var maxLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .black
        $0.textAlignment = .right
        $0.font = UIFont(name: "Avenir Next", size: 16)
        $0.text = "500"
        
        return $0
    }(UILabel())
    
    private lazy var slider: Slider = {
        $0.setThumbImage(UIImage(named: "thumb"), for: .normal)
        $0.minimumTrackTintColor = Colors.sliderMinimum
        $0.maximumTrackTintColor = Colors.sliderMaximum
        $0.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        
        return $0
    }(Slider())
    
    init() {
        super.init(frame: .zero)
        setupSubviews()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(
        config: ViewConfig
    ) {
        slider.isContinuous = false
        nameLabel.text = config.name
        minLabel.text = "\(config.minValue)" + " " + "\(config.measurementUnits)"
        maxLabel.text = "\(config.maxValue)" + " " + "\(config.measurementUnits)"
        slider.minimumValue = Float(config.minValue)
        slider.maximumValue = Float(config.maxValue)
        precondition(config.currentValue ?? Int(slider.minimumValue) >= Int(slider.minimumValue) && config.currentValue ?? Int(slider.maximumValue) <= Int(slider.maximumValue), "Значение слайдера находится вне допустимых границ")
        initialValue = config.currentValue
    }
    
    private func setupSubviews() {
        addSubviews(nameLabel, minLabel, maxLabel, slider)

        NSLayoutConstraint.activate([
            
            slider.widthAnchor.constraint(equalTo: widthAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.heightAnchor.constraint(equalToConstant: 16),
            
            minLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            minLabel.bottomAnchor.constraint(equalTo: slider.topAnchor),
            
            maxLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            maxLabel.bottomAnchor.constraint(equalTo: slider.topAnchor),
            maxLabel.centerYAnchor.constraint(equalTo: minLabel.centerYAnchor),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: minLabel.topAnchor, constant: 8)
        ])
    }
    
    @objc private func sliderValueChanged() {
        onCurrentValue?(Int(slider.value))
    }
}

class Slider: UISlider {
   let trackHeight: CGFloat = 8
   override func trackRect(forBounds bounds: CGRect) -> CGRect {
      let track = super.trackRect(forBounds: bounds)
      return CGRect(x: track.origin.x, y: track.origin.y, width: track.width, height: trackHeight)
   }
    
    override func thumbRect(forBounds bounds: CGRect, trackRect rect: CGRect, value: Float) -> CGRect {
        let thumbRect = super.thumbRect(forBounds: bounds, trackRect: rect, value: value)
        var newRect: CGRect
        if value == minimumValue {
            newRect = CGRect(
                x: thumbRect.origin.x - 3,
                y: thumbRect.origin.y + 2,
                width: thumbRect.size.width,
                height: thumbRect.size.height)
            return newRect
        } else if value == maximumValue {
            newRect = CGRect(
                x: thumbRect.origin.x + 3,
                y: thumbRect.origin.y + 2,
                width: thumbRect.size.width,
                height: thumbRect.size.height)
            return newRect
        } else {
            newRect = CGRect(
                x: thumbRect.origin.x,
                y: thumbRect.origin.y + 2,
                width: thumbRect.size.width,
                height: thumbRect.size.height)
        }
        
        return newRect
    }
    
    override func minimumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        let track = super.minimumValueImageRect(forBounds: bounds)
        return CGRect(x: track.origin.x, y: track.origin.y, width: track.width, height: trackHeight)
    }

    override func maximumValueImageRect(forBounds bounds: CGRect) -> CGRect {
        let track = super.maximumValueImageRect(forBounds: bounds)
        return CGRect(x: track.origin.x, y: track.origin.y, width: track.width, height: trackHeight)
    }
}
