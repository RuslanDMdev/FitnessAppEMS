//
//  ScreenTraningViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 13.10.2022.
//

import UIKit
import SnapKit

class ScreenTraningViewController: UIViewController {

    private let shapeImage = UIImageView()
    private let labelTraning = UILabel()
    private let nameImage = UIImageView()
    private let buttonBack = UIButton()
    private let labelMainText = UILabel()
    private let labelSubText = UILabel()
    private let viewTotalPulsePower = UIView()

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



        
        shapeImage.image = UIImage(named: "lowerup")
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
        
        
        scrollView.snp.makeConstraints { make in
                make.width.equalTo(viewElementWidht)
                make.centerX.equalToSuperview()
                make.top.equalToSuperview().inset(170)
            make.bottom.equalToSuperview().inset(30)
        }
        
        labelMainText.text = "Кардио"
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
        
        
        viewTotalPulsePower.backgroundColor = #colorLiteral(red: 0.8235294118, green: 0.9529411765, blue: 0.9333333333, alpha: 1)
        stackView.addSubview(viewTotalPulsePower)
        viewTotalPulsePower.layer.cornerRadius = 10
        viewTotalPulsePower.snp.makeConstraints { make in
            make.top.equalTo(labelSubText.snp.bottom).offset(20)
            make.left.right.equalTo(contentView).inset(20)
            make.centerX.equalTo(contentView)
            make.height.equalTo(120)
        }
        
        let minusButton1 = UIButton()
        viewTotalPulsePower.addSubview(minusButton1)
        minusButton1.setImage(UIImage(systemName: "minus.circle"), for: .normal)
        minusButton1.snp.makeConstraints { make in
            make.centerY.equalToSuperview().inset(20)
            make.left.equalToSuperview().inset(20)
        }
        minusButton1.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(35)
        })
//        minusButton1.addTarget(self, action: #selector(), for: .touchUpInside)

        
        let plusButton1 = UIButton(type: .system)
        viewTotalPulsePower.addSubview(plusButton1)
        plusButton1.setImage(UIImage(systemName: "plus.circle"), for: .normal)
        plusButton1.snp.makeConstraints { make in
            make.centerY.equalToSuperview().inset(20)
            make.right.equalToSuperview().inset(20)
        }
        plusButton1.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(35)
        })
//        plusButton1.translatesAutoresizingMaskIntoConstraints = false
//        plusButton1.addTarget(self, action: #selector(), for: .touchUpInside)

        stackView.addSubview(shoulders)
        stackView.addSubview(belly)
        stackView.addSubview(chest)
        stackView.addSubview(legs)
        stackView.addSubview(backUpside)
        stackView.addSubview(buttocks)
        stackView.addSubview(backDownside)
        stackView.addSubview(hands)
        
        
        
        shoulders.snp.makeConstraints { make in
            make.top.equalTo(viewTotalPulsePower.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        belly.snp.makeConstraints { make in
            make.top.equalTo(shoulders.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
                }
        chest.snp.makeConstraints { make in
            make.top.equalTo(belly.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        legs.snp.makeConstraints { make in
            make.top.equalTo(chest.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        backUpside.snp.makeConstraints { make in
            make.top.equalTo(legs.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        buttocks.snp.makeConstraints { make in
            make.top.equalTo(backUpside.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
        backDownside.snp.makeConstraints { make in
            make.top.equalTo(buttocks.snp.bottom).offset(5)
            make.left.right.equalTo(contentView).inset(20)
            make.height.equalTo(100)
        }
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
        present(nacVC, animated: false)
    }
}

