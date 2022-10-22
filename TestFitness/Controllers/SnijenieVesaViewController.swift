//
//  SnijenieVesaViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 20.10.2022.
//

import UIKit
import SnapKit

class SnijenieVesaViewController: UIViewController {

    private let shapeImage = UIImageView()
    private let labelTraning = UILabel()
    private let nameImage = UIImageView()
    private let buttonBack = UIButton()
    private let labelMainText = UILabel()
    private let labelSubText = UILabel()
    private let buttonGetDefault = UIButton()
    private let buttonStartTraning = UIButton()

    private let totalPulsePower = upControlView(name: "Общая Мощность Импульсов")
    private let pulseDuration = upControlView(name: "Продолжительность Импульса")
    private let pauseDuration = upControlView(name: "Продолжительность Паузы")
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
            CGSize(width: view.frame.width-40, height: view.frame.height + 330)
        }
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
        stackView.addSubview(labelMainText)
        stackView.addSubview(labelSubText)
        stackView.addSubview(totalPulsePower)
        stackView.addSubview(pulseDuration)
        stackView.addSubview(pauseDuration)
        stackView.addSubview(buttonGetDefault)
        stackView.addSubview(buttonStartTraning)
        
        scrollView.snp.makeConstraints { make in
                make.width.equalTo(viewElementWidht)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(170)
            make.bottom.equalToSuperview().inset(30)
        }
        
        labelMainText.text = "Снижение веса"
        labelMainText.font = UIFont.boldSystemFont(ofSize: 20)
        labelMainText.snp.makeConstraints { make in
            make.top.equalTo(10)
            make.centerX.equalTo(contentView)
        }
        
        labelSubText.text = "Сейчас Вы чувствуете импульсы с Вашей последней тренировки этого типа,но на 15% ниже. Выставьте импульсы на все мышечные группы и чтобы они хорошо ощущались, но не были болезненными для вас. Как будете готовы, переходите к следующему этапу."
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
        
        
        shoulders.layer.cornerRadius = 15
        shoulders.snp.makeConstraints { make in
            make.top.equalTo(pulseDuration.snp.bottom).offset(10)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        belly.layer.cornerRadius = 15
        belly.snp.makeConstraints { make in
            make.top.equalTo(shoulders.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
                }
        
        chest.layer.cornerRadius = 15
        chest.snp.makeConstraints { make in
            make.top.equalTo(belly.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        legs.layer.cornerRadius = 15
        legs.snp.makeConstraints { make in
            make.top.equalTo(chest.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        backUpside.layer.cornerRadius = 15
        backUpside.snp.makeConstraints { make in
            make.top.equalTo(legs.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        buttocks.layer.cornerRadius = 15
        buttocks.snp.makeConstraints { make in
            make.top.equalTo(backUpside.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        backDownside.layer.cornerRadius = 15
        backDownside.snp.makeConstraints { make in
            make.top.equalTo(buttocks.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        hands.layer.cornerRadius = 15
        hands.snp.makeConstraints { make in
            make.top.equalTo(backDownside.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(70)
        }
        
        buttonGetDefault.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        buttonGetDefault.setTitle("Сбросить к заводским настройкам", for: .normal)
        buttonGetDefault.setTitleColor(#colorLiteral(red: 0, green: 0.6090424132, blue: 1, alpha: 0.8491300873), for: .normal)
        buttonGetDefault.snp.makeConstraints { make in
            make.top.equalTo(hands.snp.bottom).offset(10)
            make.centerX.equalTo(contentView)
        }
        
        buttonStartTraning.layer.cornerRadius = 30
        buttonStartTraning.setTitleColor(.white, for: .normal)
        buttonStartTraning.setTitle("Начать тренировку", for: .normal)
        buttonStartTraning.backgroundColor = UIColor(displayP3Red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        buttonStartTraning.snp.makeConstraints { make in
            make.top.equalTo(buttonGetDefault.snp.bottom).offset(10)
            make.centerX.equalTo(contentView)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(60)
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
