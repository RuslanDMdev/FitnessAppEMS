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
            CGSize(width: view.frame.width-40, height: view.frame.height + 400)
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
        labelSubText.backgroundColor = .green
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

    }
    
    // MARK: - Open Settings
    
    @objc func openViewController() {
        let rootVC = ViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: false)
    }
}

