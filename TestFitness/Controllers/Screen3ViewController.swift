//
//  Screen3ViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 13.10.2022.
//

import UIKit
import SnapKit

class Screen3ViewController: UIViewController {
    
    private let NameImage = UIImageView()
    private let labelTraning = UILabel()
    private let buttonBack = UIButton()
    private let shoulders = upControlView(name: "Плечи")
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        
    }


    // MARK: - UI
    
    private func setupSubviews() {
        
        self.view.backgroundColor = .white
        
        view.addSubview(buttonBack)
        view.addSubview(labelTraning)
        view.addSubview(NameImage)
        view.addSubview(shoulders)
        
        NameImage.image = UIImage(named: "name")
        NameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        buttonBack.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        buttonBack.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(NameImage).inset(80)
            make.left.equalTo(20)
        }
        buttonBack.addTarget(self, action: #selector(openViewController), for: .touchUpInside)
        
        labelTraning.text = "Главный экран"
        labelTraning.font = UIFont.boldSystemFont(ofSize: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(NameImage).inset(80)
        }
        
        shoulders.snp.makeConstraints { make in
            make.top.equalTo(labelTraning.snp.bottom).offset(50)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(100)
        }
    

    }
    
    // MARK: - Open Settings
    
    @objc func openViewController() {
        let rootVC = ViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
}

