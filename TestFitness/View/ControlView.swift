//
//  ControlView.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 14.10.2022.
//

import Foundation
import UIKit

class ControlView: UIView {
    
    // MARK: - Interface
    
    var onDecrease: (() -> Void)?
    var onIncrease: (() -> Void)?
    private let name: String
    
    // MARK: - Subviews
    
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "buttonBack")
        
        return view
    }()
    
    private let minus: MinusButton = {
        let button = MinusButton()
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(decreaseTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let plus: PlusButton = {
        let button = PlusButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(increaseTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = UIFont(name: "Avenir Next Medium", size: 18)
        view.textColor = Colors.labelColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = name
        
        return view
    }()
    
    private let numberLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.textColor = Colors.numberColor
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()

    private let numberContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 12
        view.backgroundColor = Colors.transparentBack
        
        return view
    }()
    
    // MARK: - Interface methods
    
    init(name: String) {
        self.name = name
        super.init(frame: .zero)
        clipsToBounds = true
        setupSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showNumber(number: Int?) {
        numberLabel.text = "\(number ?? 0)"
        
        if number == 100 {
            numberLabel.font = UIFont(name: "Avenir Next Medium", size: 26)
        } else {
            numberLabel.font = UIFont(name: "Avenir Next Medium", size: 32)
        }
    }
    
    // MARK: - Private methods
    
    private func setupSubviews() {
        addSubview(background)
        insertSubview(minus, aboveSubview: background)
        insertSubview(plus, aboveSubview: background)
        insertSubview(nameLabel, aboveSubview: background)
        insertSubview(numberContainer, aboveSubview: background)
        numberContainer.addSubview(numberLabel)
        
        [
            widthAnchor.constraint(equalTo: heightAnchor),
            
            background.leadingAnchor.constraint(equalTo: leadingAnchor),
            background.trailingAnchor.constraint(equalTo: trailingAnchor),
            background.topAnchor.constraint(equalTo: topAnchor),
            background.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            minus.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            minus.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -22),
            minus.widthAnchor.constraint(equalToConstant: 28),
            minus.heightAnchor.constraint(equalToConstant: 8),
            
            plus.topAnchor.constraint(equalTo: topAnchor, constant: 14),
            plus.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            plus.widthAnchor.constraint(equalToConstant: 22),
            plus.heightAnchor.constraint(equalToConstant: 22),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 50),
            
            numberContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -18),
            numberContainer.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            numberContainer.widthAnchor.constraint(equalToConstant: 60),
            numberContainer.heightAnchor.constraint(equalToConstant: 44),
            
            numberLabel.heightAnchor.constraint(equalTo: numberContainer.heightAnchor),
            numberLabel.centerXAnchor.constraint(equalTo: numberContainer.centerXAnchor),
            numberLabel.centerYAnchor.constraint(equalTo: numberContainer.centerYAnchor)
            
        ].forEach { $0.isActive = true }
    }
    
    // MARK: - Actions
    
    @objc private func decreaseTapped() {
        onDecrease?()
    }
    
    @objc private func increaseTapped() {
        onIncrease?()
    }
}

extension ControlView {
    
    override var description: String {
        return name
    }
}

fileprivate class MinusButton: UIButton {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let touchArea = CGRect(
            x: self.bounds.origin.x - 5,
            y: self.bounds.origin.y - 5,
            width: self.bounds.width + 10,
            height: self.bounds.width + 10
        )
        return touchArea.contains(point)
    }
}

fileprivate class PlusButton: UIButton {
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let touchArea = CGRect(
            x: self.bounds.origin.x - 5,
            y: self.bounds.origin.y - 5,
            width: self.bounds.width + 10,
            height: self.bounds.width + 10
        )
        return touchArea.contains(point)
    }
}
