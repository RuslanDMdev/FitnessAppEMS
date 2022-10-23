//
//  TimerTrenViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 23.10.2022.
//

import UIKit

class TimerTrenViewController: UIViewController {
    
    private let NameImage = UIImageView()
    private let labelTraning = UILabel()
    private let buttonBack = UIButton()
    private let shapeImage = UIImageView()
    private let timerLabel = UILabel()

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
        view.addSubview(shapeImage)
        shapeImage.addSubview(timerLabel)
        
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
        
        buttonBack.addTarget(self, action: #selector(pediduschyController), for: .touchUpInside)
        
        labelTraning.text = "Разминка"
        labelTraning.font = UIFont.boldSystemFont(ofSize: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(NameImage).inset(80)
        }
        
        shapeImage.image = UIImage(named: "round2")
        shapeImage.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(300)
            make.centerX.centerY.equalToSuperview()
        }
        
        timerLabel.text = "0"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 40)
        timerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            
        }
    

    }
    
    // MARK: - Open Controllers
    
    //Добавить алерт "вы точно хотите закрыть тренировку?"
    @objc func pediduschyController() {
        let rootVC = ViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
    
    @objc func playAction() {

    }
}
