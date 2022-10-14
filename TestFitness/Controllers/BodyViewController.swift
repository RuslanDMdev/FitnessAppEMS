//
//  BodyViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 14.10.2022.
//

import UIKit

class BodyViewController: UIViewController {
    
    
    private let shoulders = ControlView(name: "Плечи")
    private let belly = ControlView(name: "Живот")
    private let chest = ControlView(name: "Грудь")
    private let legs = ControlView(name: "Ноги")
    private let backUpside = ControlView(name: "Верх спины")
    private let buttocks = ControlView(name: "Ягодицы")
    private let backDownside = ControlView(name: "Низ спины")
    private let hands = ControlView(name: "Руки")
    
    
    private lazy var leftContainer: UIView = {
        $0.addSubviews(shoulders, belly, chest, legs)
        
        return $0
    }(UIView())
    
    private lazy var rightContainer: UIView = {
        $0.addSubviews(backUpside, backDownside, buttocks, hands)
        
        return $0
    }(UIView())
    
    private let bodyImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "body")
        $0.contentMode = .scaleAspectFit
        
        return $0
    }(UIImageView())
    
    private let settingsButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(named: "settings"), for: .normal)
        
        return $0
    }(UIButton())
    
    
    
//    @available(*, unavailable)
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.bodyBack
        navigationController?.navigationBar.isHidden = true
        setupSubviews()
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    // MARK: - Layout
    
    private func setupSubviews() {
        view.addSubviews(leftContainer, rightContainer)
        view.insertSubview(bodyImage, belowSubview: leftContainer)
        view.insertSubview(settingsButton, aboveSubview: bodyImage)
        
        [
            bodyImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bodyImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            leftContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38),
            leftContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
            leftContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            rightContainer.topAnchor.constraint(equalTo: view.topAnchor, constant: 28),
            rightContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -38),
            rightContainer.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            shoulders.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor),
            shoulders.topAnchor.constraint(equalTo: leftContainer.topAnchor),
            shoulders.widthAnchor.constraint(equalToConstant: 160),
            shoulders.heightAnchor.constraint(equalToConstant: 160),
            
            legs.leadingAnchor.constraint(equalTo: leftContainer.leadingAnchor),
            legs.bottomAnchor.constraint(equalTo: leftContainer.bottomAnchor),
            legs.widthAnchor.constraint(equalToConstant: 160),
            legs.heightAnchor.constraint(equalToConstant: 160),
            
            belly.topAnchor.constraint(equalTo: leftContainer.topAnchor),
            belly.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor),
            belly.widthAnchor.constraint(equalToConstant: 160),
            belly.heightAnchor.constraint(equalToConstant: 160),
            
            chest.bottomAnchor.constraint(equalTo: leftContainer.bottomAnchor),
            chest.trailingAnchor.constraint(equalTo: leftContainer.trailingAnchor),
            chest.widthAnchor.constraint(equalToConstant: 160),
            chest.heightAnchor.constraint(equalToConstant: 160),
            
            backUpside.leadingAnchor.constraint(equalTo: rightContainer.leadingAnchor),
            backUpside.topAnchor.constraint(equalTo: rightContainer.topAnchor),
            backUpside.widthAnchor.constraint(equalToConstant: 160),
            backUpside.heightAnchor.constraint(equalToConstant: 160),
            
            backDownside.leadingAnchor.constraint(equalTo: rightContainer.leadingAnchor),
            backDownside.bottomAnchor.constraint(equalTo: rightContainer.bottomAnchor),
            backDownside.widthAnchor.constraint(equalToConstant: 160),
            backDownside.heightAnchor.constraint(equalToConstant: 160),
            
            buttocks.topAnchor.constraint(equalTo: rightContainer.topAnchor),
            buttocks.trailingAnchor.constraint(equalTo: rightContainer.trailingAnchor),
            buttocks.widthAnchor.constraint(equalToConstant: 160),
            buttocks.heightAnchor.constraint(equalToConstant: 160),
            
            hands.bottomAnchor.constraint(equalTo: rightContainer.bottomAnchor),
            hands.trailingAnchor.constraint(equalTo: rightContainer.trailingAnchor),
            hands.widthAnchor.constraint(equalToConstant: 160),
            hands.heightAnchor.constraint(equalToConstant: 160),
            
            
            
            settingsButton.topAnchor.constraint(equalTo: hands.bottomAnchor, constant: 8),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.leadingAnchor.constraint(equalTo: leftContainer.trailingAnchor, constant: 2),
            settingsButton.trailingAnchor.constraint(equalTo: rightContainer.leadingAnchor, constant: -2),
            settingsButton.heightAnchor.constraint(equalTo: settingsButton.widthAnchor, multiplier: 56 / 98)
            
        ].forEach { $0.isActive = true }
    }
}
