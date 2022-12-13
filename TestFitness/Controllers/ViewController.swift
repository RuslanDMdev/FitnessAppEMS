//
//  ViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 13.10.2022.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let shapeImage = UIImageView()
    private let NameImage = UIImageView()
    private let labelTraning = UILabel()
    private let buttonKardio = UIButton()
    private let buttonSilovay = UIButton()
    private let buttonSnijenieVesa = UIButton()
    private let buttonHandmode = UIButton()
    private let buttonBack = UIButton()
    private let buttonSettings = UIButton()
    private let containerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
    }


    // MARK: - UI
    
    private func setupSubviews() {
        
        
        
        view.backgroundColor = #colorLiteral(red: 0.9568627451, green: 0.9568627451, blue: 0.9568627451, alpha: 1)
        view.addSubview(shapeImage)
        view.addSubview(buttonBack)
        view.addSubview(labelTraning)
        view.addSubview(NameImage)
        view.addSubview(buttonSettings)
        view.addSubview(containerView)
        containerView.addSubview(buttonKardio)
        containerView.addSubview(buttonSilovay)
        containerView.addSubview(buttonSnijenieVesa)
        containerView.addSubview(buttonHandmode)
        
//        let sizeForViews = view.frame.size.width/4-10
        let containerHeight = view.frame.size.height/4 * 3
        let sizeViewInContainer = containerHeight/5-10
        let realContainerheight = containerHeight/5 * 4 + 40
        
        shapeImage.image = UIImage(named: "upIcon")
        shapeImage.snp.makeConstraints { make in
            make.left.right.equalTo(0)
            make.height.equalTo(230)
        }
        
        NameImage.image = UIImage(named: "name")
        NameImage.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
        }
        
        buttonBack.setImage(UIImage(systemName: "info.circle"), for: .normal)
        buttonBack.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        buttonBack.snp.makeConstraints { make in
            make.top.equalTo(NameImage).inset(80)
            make.left.equalTo(20)
        }
        buttonBack.addTarget(self, action: #selector(openScreen3), for: .touchUpInside)
        
        buttonSettings.setImage(UIImage(systemName: "gearshape"), for: .normal)
        buttonSettings.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        buttonSettings.snp.makeConstraints { make in
            make.top.equalTo(NameImage).inset(80)
            make.right.equalToSuperview().inset(20)
        }
//        buttonSettings.addTarget(self, action: #selector(), for: .touchUpInside)
    
        
        labelTraning.text = "Тренировки"
        labelTraning.font = UIFont(name: "Avenir Next Medium", size: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(NameImage).inset(80)
        }
        
//        containerView.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        
        if view.frame.size.width <= 440 {
            containerView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.height.equalTo(realContainerheight)
                //            make.centerY.equalToSuperview().offset(50)
                make.bottom.equalToSuperview().inset(20)
                make.left.right.equalToSuperview().inset(30)
            }
        } else {
            containerView.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.height.equalTo(realContainerheight-50)
                make.bottom.equalToSuperview().inset(150)
                make.width.equalTo(500)
            }
        }
        
        buttonSilovay.setTitle("Силовая тренировка", for: .normal)
        buttonSilovay.setTitleColor(.black, for: .normal)
        buttonSilovay.setTitleColor(.gray, for: .highlighted)
        buttonSilovay.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        buttonSilovay.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(25)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        })
        buttonSilovay.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonSilovay.layer.cornerRadius = 15
        buttonSilovay.snp.makeConstraints { make in
//            make.top.equalTo(NameImage).inset(250)
            make.top.equalTo(0)
            make.left.right.equalTo(0)
//            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(sizeViewInContainer)
        }
        buttonSilovay.addTarget(self, action: #selector(openSilovaay), for: .touchUpInside)
        
        buttonKardio.setTitle("Кардио", for: .normal)
        buttonKardio.setTitleColor(.black, for: .normal)
        buttonKardio.setTitleColor(.gray, for: .highlighted)
        buttonKardio.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        buttonKardio.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(25)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        })
        buttonKardio.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonKardio.layer.cornerRadius = 15
        buttonKardio.snp.makeConstraints { make in
            make.top.equalTo(buttonSilovay.snp.bottom).offset(20)
//            make.left.right.equalToSuperview().inset(30)
            make.left.right.equalTo(0)
            make.height.equalTo(sizeViewInContainer)
        }
        buttonKardio.addTarget(self, action: #selector(openKardio), for: .touchUpInside)
        
        buttonSnijenieVesa.setTitle("Снижение веса", for: .normal)
        buttonSnijenieVesa.setTitleColor(.black, for: .normal)
        buttonSnijenieVesa.setTitleColor(.gray, for: .highlighted)
        buttonSnijenieVesa.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        buttonSnijenieVesa.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(25)
            make.right.equalToSuperview().inset(20)
            make.centerY.equalToSuperview()
        })
        buttonSnijenieVesa.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonSnijenieVesa.layer.cornerRadius = 15
        buttonSnijenieVesa.snp.makeConstraints { make in
            make.top.equalTo(buttonKardio.snp.bottom).offset(20)
//            make.left.right.equalToSuperview().inset(30)
            make.left.right.equalTo(0)
            make.height.equalTo(sizeViewInContainer)
        }
        buttonSnijenieVesa.addTarget(self, action: #selector(openSnijenieVesa), for: .touchUpInside)

        buttonHandmode.setTitle("Ручной режим", for: .normal)
        buttonHandmode.setTitleColor(.black, for: .normal)
        buttonHandmode.setTitleColor(.gray, for: .highlighted)
        buttonHandmode.setImage(UIImage(systemName: "arrow.forward"), for: .normal)
        buttonHandmode.imageView?.snp.makeConstraints({ make in
            make.right.equalToSuperview().inset(20)
            make.width.height.equalTo(25)
            make.centerY.equalToSuperview()
        })
        buttonHandmode.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        buttonHandmode.layer.cornerRadius = 15
        buttonHandmode.snp.makeConstraints { make in
            make.top.equalTo(buttonSnijenieVesa.snp.bottom).offset(20)
//            make.left.right.equalToSuperview().inset(30)
            make.left.right.equalTo(0)
            make.height.equalTo(sizeViewInContainer)
        }
        buttonHandmode.addTarget(self, action: #selector(openHandMode), for: .touchUpInside)

    }
    
    // MARK: - Open Screens
    
    @objc func openSettingsViewController(){
        let rootVC = infoAppController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
    
    @objc func openScreen3() {
        let rootVC = infoAppController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
    
    @objc func openSilovaay() {
        let rootVC = SilovayViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)

    }
    
    @objc func openKardio() {
        let rootVC = ScreenTraningViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
    
    
    @objc func openSnijenieVesa() {
        let rootVC = SnijenieVesaViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)

    }
    
    @objc func openHandMode() {
        let rootVC = HandModeViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)

    }

}

