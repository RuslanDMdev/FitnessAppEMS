//
//  SilovayViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 20.10.2022.
//

import UIKit
import SnapKit

class SilovayViewController: UIViewController {

    
    private let shapeImage = UIImageView()
    private let labelTraning = UILabel()
    private let nameImage = UIImageView()
    private let buttonBack = UIButton()
    private let labelMainText = UILabel()
    private let labelSubText = UILabel()

    private let totalPulsePower = ControlView(name: "Общая Мощность Импульсов")
    private let pulseDuration = ControlView(name: "Продолжительность Импульса")
    private let pauseDuration = ControlView(name: "Продолжительность Паузы")
    private let shoulders = ControlView(name: "Плечи")
    private let belly = ControlView(name: "Живот")
    private let chest = ControlView(name: "Грудь")
    private let legs = ControlView(name: "Ноги")
    private let backUpside = ControlView(name: "Верх спины")
    private let buttocks = ControlView(name: "Ягодицы")
    private let backDownside = ControlView(name: "Низ спины")
    private let hands = ControlView(name: "Руки")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        
    }


    // MARK: - UI
    
    private func setupSubviews() {
        
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        
        view.addSubview(shapeImage)
        view.addSubview(nameImage)
        view.addSubview(buttonBack)
        view.addSubview(labelTraning)


        
        shapeImage.image = UIImage(named: "upIcon")
        shapeImage.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.height.equalTo(230)
        }
        
        nameImage.image = UIImage(named: "name")
        nameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        buttonBack.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        buttonBack.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(nameImage).inset(80)
            make.left.equalTo(20)
        }
        buttonBack.addTarget(self, action: #selector(openViewController), for: .touchUpInside)
        
        labelTraning.text = "Тренировка"
        labelTraning.font = UIFont.boldSystemFont(ofSize: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(shapeImage).inset(130)
        }
        
        
        lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//            scrollView.frame = self.view.bounds
            scrollView.contentSize = contentSize
            scrollView.layer.cornerRadius = 20

            return scrollView
        }()
        
        lazy var contentView: UIView = {
            let contentView = UIView()
            contentView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            contentView.frame.size = contentSize
            return contentView
        }()
        
        let stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.alignment = .center
            stackView.spacing = 20
            return stackView
        }()
        
        let viewElementWidht: CGFloat = view.frame.size.width-40
        var contentSize: CGSize {
            CGSize(width: view.frame.width-40, height: view.frame.height + 700)
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addSubview(labelMainText)
        stackView.addSubview(labelSubText)
        stackView.addSubview(totalPulsePower)
        stackView.addSubview(pulseDuration)
        stackView.addSubview(pauseDuration)
        
        scrollView.snp.makeConstraints { make in
                make.width.equalTo(viewElementWidht)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(170)
            make.bottom.equalToSuperview().inset(30)
        }
        
        labelMainText.text = "Силовая"
        labelMainText.font = UIFont.boldSystemFont(ofSize: 20)
        labelMainText.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(contentView)
        }
        
        labelSubText.text = "Сейчас Вы чувствуете импульсы с Вашей последней тренировки этого типа,но на 15% ниже. Выставьте импульсы на все мышечные группы и чтобы они хорошо ощущались, но не были болезненными для вас.               Как будете готовы, переходите к следующему этапу."
        labelSubText.numberOfLines = 0
        labelSubText.textAlignment = .justified
        labelSubText.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(170)
            make.top.equalTo(labelMainText).inset(30)
        }
        
        
        let sizeForTwoViews = contentView.frame.size.width/2-25
        
        totalPulsePower.backgroundColor = #colorLiteral(red: 0.6457901581, green: 0.9529411765, blue: 0.9333333333, alpha: 1)
        totalPulsePower.layer.cornerRadius = 15
        totalPulsePower.snp.makeConstraints { make in
            make.top.equalTo(labelSubText.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        pulseDuration.backgroundColor = #colorLiteral(red: 0.7062368442, green: 0.9251035604, blue: 0.6856263216, alpha: 1)
        pulseDuration.layer.cornerRadius = 15
        pulseDuration.snp.makeConstraints { make in
            make.top.equalTo(totalPulsePower.snp.bottom).offset(10)
            make.left.equalTo(contentView).inset(20)
            make.width.equalTo(sizeForTwoViews)
            make.height.equalTo(100)
        }
        
        pauseDuration.backgroundColor = #colorLiteral(red: 0.7062368442, green: 0.9251035604, blue: 0.6856263216, alpha: 1)
        pauseDuration.layer.cornerRadius = 15
        pauseDuration.snp.makeConstraints { make in
            make.top.equalTo(totalPulsePower.snp.bottom).offset(10)
            make.width.equalTo(sizeForTwoViews)
            make.height.equalTo(100)
            make.right.equalTo(contentView).inset(20)
        }

        stackView.addSubview(shoulders)
        stackView.addSubview(belly)
        stackView.addSubview(chest)
        stackView.addSubview(legs)
        stackView.addSubview(backUpside)
        stackView.addSubview(buttocks)
        stackView.addSubview(backDownside)
        stackView.addSubview(hands)
        
        
        shoulders.layer.cornerRadius = 30
        shoulders.snp.makeConstraints { make in
            make.top.equalTo(pulseDuration.snp.bottom).offset(10)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        belly.layer.cornerRadius = 30
        belly.layer.cornerRadius = 30
        belly.snp.makeConstraints { make in
            make.top.equalTo(shoulders.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
                }
        
        chest.layer.cornerRadius = 30
        chest.snp.makeConstraints { make in
            make.top.equalTo(belly.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        legs.layer.cornerRadius = 30
        legs.snp.makeConstraints { make in
            make.top.equalTo(chest.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        backUpside.layer.cornerRadius = 30
        backUpside.snp.makeConstraints { make in
            make.top.equalTo(legs.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        buttocks.layer.cornerRadius = 30
        buttocks.snp.makeConstraints { make in
            make.top.equalTo(backUpside.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        backDownside.layer.cornerRadius = 30
        backDownside.snp.makeConstraints { make in
            make.top.equalTo(buttocks.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        
        hands.layer.cornerRadius = 30
        hands.snp.makeConstraints { make in
            make.top.equalTo(backDownside.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
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
