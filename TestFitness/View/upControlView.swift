//
//  upControlView.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 20.10.2022.
//

import UIKit
import SnapKit

class upControlView: UIView {

    // MARK: - Interface
    
    var onDecrease: (() -> Void)?
    var onIncrease: (() -> Void)?
    private let name: String
    
    // MARK: - Subviews
    
    private let background: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.contentMode = .scaleAspectFill
//        view.image = UIImage(named: "buttonBack")
        view.image = UIImage(named: "backImage2")
        view.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        
        return view
    }()
    
    private let minus: MinusButton = {
        let button = MinusButton()
        button.setImage(UIImage(named: "minus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(ControlView.self, action: #selector(decreaseTapped), for: .touchUpInside)
        
        return button
    }()
    
    private let plus: PlusButton = {
        let button = PlusButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(ControlView.self, action: #selector(increaseTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = UIFont(name: "Avenir Next Medium", size: 12)
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
            
            background.leadingAnchor.constraint(equalTo: leadingAnchor)

            
        ].forEach { $0.isActive = true }
        
        background.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(0)
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(background)
            make.left.equalToSuperview().inset(20)
        }
        
        minus.snp.makeConstraints { make in
            make.centerY.equalTo(background)
            make.right.equalTo(numberContainer).inset(60)
        }
        
        numberContainer.snp.makeConstraints { make in
            make.centerY.equalTo(background)
            make.right.equalTo(plus).inset(40)
            make.width.equalTo(40)
            make.height.equalTo(20)
        }

        numberContainer.addSubview(numberLabel)
        numberLabel.backgroundColor = Colors.transparentBack
        numberLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
            make.height.equalTo(20)
        }
        
        plus.snp.makeConstraints { make in
            make.centerY.equalTo(background)
            make.right.equalToSuperview().inset(20)
            
        }

    }
    
    // MARK: - Actions
    
    @objc private func decreaseTapped() {
        print("Кнопка минус нажата")
//        onDecrease?()
    }
    
    @objc private func increaseTapped() {
        print("Кнопка плюс нажата")
//        onIncrease?()
    }
}

extension upControlView {
    
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

