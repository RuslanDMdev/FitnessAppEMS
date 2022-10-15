//
//  newControlView.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 15.10.2022.
//

import UIKit
import SnapKit

class newControlView: UIView {

    // MARK: - Interface
    
    var onDecrease: (() -> Void)?
    var onIncrease: (() -> Void)?
    private let name: String
    
    // MARK: - Subviews
    
    private let background = UIImageView()
    private let minus = MinusButton()
    private let plus = PlusButton()
    private lazy var nameLabel = UILabel()
    private let numberLabel = UILabel()
    private let numberContainer = UIView()
    
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
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        viewInit()
        
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
        
        background.isHidden = false
        background.backgroundColor = .cyan
        background.contentMode = .scaleAspectFill
        background.image = UIImage(named: "buttonBack")
        background.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(100)
        }
        
        minus.setImage(UIImage(named: "minus"), for: .normal)
        minus.snp.makeConstraints { make in

        }
        
        plus.setImage(UIImage(named: "plus"), for: .normal)
        plus.snp.makeConstraints { make in

        }
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont(name: "Avenir Next Medium", size: 18)
        nameLabel.textColor = Colors.labelColor
        nameLabel.text = name
        nameLabel.snp.makeConstraints { make in
            
        }
        
        numberContainer.layer.cornerRadius = 12
        numberContainer.backgroundColor = Colors.transparentBack
        numberContainer.snp.makeConstraints { make in
            
        }
        
        numberLabel.textAlignment = .center
        numberLabel.textColor = Colors.numberColor
        numberLabel.snp.makeConstraints { make in
            
        }
       
    }
    
    // MARK: - Actions
    
    @objc private func decreaseTapped() {
        onDecrease?()
    }
    
    @objc private func increaseTapped() {
        onIncrease?()
    }
}

extension newControlView {
    
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
