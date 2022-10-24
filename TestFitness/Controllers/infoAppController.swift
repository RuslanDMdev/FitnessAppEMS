//
//  Screen3ViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 13.10.2022.
//

import UIKit
import SnapKit

class infoAppController: UIViewController {
    
    private let iconAppImage = UIImageView()
    private let labelTraning = UILabel()
    private let buttonBack = UIButton()
    private let vesionLabel = UILabel()
    private let infoLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        
    }


    // MARK: - UI
    
    private func setupSubviews() {
        
        self.view.backgroundColor = .white
        
        view.addSubview(buttonBack)
        view.addSubview(labelTraning)
        view.addSubview(iconAppImage)
        view.addSubview(vesionLabel)
        view.addSubview(infoLabel)

        buttonBack.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        buttonBack.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        buttonBack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.equalTo(20)
        }
        buttonBack.addTarget(self, action: #selector(openViewController), for: .touchUpInside)
        
        labelTraning.text = "О приложении"
        labelTraning.font = UIFont.boldSystemFont(ofSize: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().inset(50)
        }
        
        iconAppImage.backgroundColor = #colorLiteral(red: 0.1607843137, green: 0.1647058824, blue: 0.1882352941, alpha: 1)
        iconAppImage.image = UIImage(named: "spider")
        iconAppImage.snp.makeConstraints { make in
            make.top.equalTo(labelTraning).inset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(100)
        }
    
        vesionLabel.text = "Версия 1.0"
        vesionLabel.font = UIFont.systemFont(ofSize: 12)
        vesionLabel.textColor = .gray
        vesionLabel.snp.makeConstraints { make in
            make.top.equalTo(iconAppImage.snp.bottom).offset(10)
            make.centerX.equalTo(iconAppImage)
        }
        
        infoLabel.text = "Короткие, но интенсивные тренировки для максимальных результатов. Хочешь похудеть, набрать мышечную массу или просто улучшить свой уровень физической подготовки? С EMS tech ты решаешь, как и где ты хочешь тренироваться. Приложение составит для тебя короткие, но интенсивные тренировки, которые принесут именно тот результат, на который ты рассчитываешь."
        infoLabel.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        infoLabel.numberOfLines = 0
//        infoLabel.textAlignment = .justified
        infoLabel.snp.makeConstraints { make in
            make.top.equalTo(vesionLabel).inset(100)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(40)
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

