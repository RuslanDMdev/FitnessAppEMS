//
//  TimerTrenViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 23.10.2022.
//

import UIKit

class TimerTrenViewController: UIViewController {
    
    private let labelTraning = UILabel()
    private let buttonBack = UIButton()
    private let shapeImage = UIImageView()
    private let timerLabel = UILabel()
    private let buttonStartTraning = UIButton()
    let text1Label = UILabel()
    let text2Label = UILabel()


    override func viewDidLoad() {
        super.viewDidLoad()

        setupSubviews()
        
    }


    // MARK: - UI
    
    private func setupSubviews() {
        
        self.view.backgroundColor = #colorLiteral(red: 0.8078431373, green: 0.8588235294, blue: 0.9333333333, alpha: 1)
        
        view.addSubview(buttonBack)
        view.addSubview(labelTraning)
        view.addSubview(shapeImage)
        view.addSubview(text1Label)
        view.addSubview(text2Label)
        shapeImage.addSubview(timerLabel)
        view.addSubview(buttonStartTraning)
        
        
        buttonBack.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        buttonBack.imageView?.snp.makeConstraints({ make in
            make.width.height.equalTo(30)
        })
        
        buttonBack.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(100)
            make.left.equalTo(20)
        }
        
        buttonBack.addTarget(self, action: #selector(pediduschyController), for: .touchUpInside)
        
        labelTraning.text = "Разминка"
        labelTraning.font = UIFont.boldSystemFont(ofSize: 25)
        labelTraning.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(buttonBack)
        }
        
//        text1Label.textColor = .white
        text1Label.text = "Тренировка начнется через"
        text1Label.font = UIFont.systemFont(ofSize: 15)
        text1Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(labelTraning).inset(130)
        }
        
        shapeImage.image = UIImage(named: "round2")
        shapeImage.snp.makeConstraints { make in
            make.width.equalTo(250)
            make.height.equalTo(250)
            make.centerX.centerY.equalToSuperview()
        }
        
        timerLabel.text = "10"
        timerLabel.font = UIFont.boldSystemFont(ofSize: 84)
        timerLabel.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            
        }
        
//        text2Label.textColor = .white
        text2Label.text = "Не забывайте пить воду"
        text2Label.font = UIFont.systemFont(ofSize: 15)
        text2Label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(shapeImage.snp.bottom).offset(50)
        }
        
        buttonStartTraning.layer.cornerRadius = 30
        buttonStartTraning.setTitleColor(.white, for: .normal)
        buttonStartTraning.setTitle("Начать тренировку", for: .normal)
        buttonStartTraning.backgroundColor = UIColor(displayP3Red: 84/255, green: 118/255, blue: 171/255, alpha: 1)
        buttonStartTraning.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        buttonStartTraning.addTarget(self, action: #selector(playAction), for: .touchUpInside)
    

    }
    
    // MARK: - Timer
    
    var timer = Timer()
    
    var durationTimer = 10

    
    @objc func timerAction() {
        
        durationTimer-=1
        timerLabel.text = "\(durationTimer)"
        print(durationTimer)
        
        if durationTimer == 0 {
            timer.invalidate()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.animationCircular()
    }
    
    // MARK: - Open Controllers
    
    //Добавить алерт "вы точно хотите закрыть тренировку?"
    @objc func pediduschyController() {
        
        let alert = UIAlertController(title: "Внимание", message: "Вы  уверены, что хотите прервать тренировку ?", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Да", style: .destructive) { (action) in
            let rootVC = ViewController()
            let nacVC = UINavigationController(rootViewController: rootVC)
            nacVC.modalPresentationStyle = .fullScreen
            self.present(nacVC, animated: true)
            self.timer.invalidate()
            
        }
        let cencelButton = UIAlertAction(title: "Отмена", style: .cancel)
        alert.addAction(cencelButton)
        alert.addAction(okButton)
        
        present(alert, animated: true)
        
    }
    
    @objc func playAction() {
        
        timerAnimation()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
    }
    
    // MARK: - Timer Animation
    
    let shapeLayer = CAShapeLayer()
    
    func animationCircular(){
        
        let center = CGPoint(x: shapeImage.frame.width/2, y: shapeImage.frame.height/2)
        
        let endAngle = (-CGFloat.pi / 2)

        let startAngle = 2 * CGFloat.pi + endAngle
            
        let circularPath = UIBezierPath(arcCenter: center, radius: 138, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        
        shapeLayer.path = circularPath.cgPath
        
        shapeLayer.lineWidth = 19 //21
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 1
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.strokeColor = #colorLiteral(red: 0.1197458597, green: 0.2219147132, blue: 0.391559816, alpha: 1).cgColor
        shapeImage.layer.addSublayer(shapeLayer)
    }
    
    func timerAnimation(){
        let timerAnimation = CABasicAnimation(keyPath: "strokeEnd")
        
        timerAnimation.toValue = 0
        timerAnimation.duration = CFTimeInterval(durationTimer)
        timerAnimation.fillMode = CAMediaTimingFillMode.forwards
        timerAnimation.isRemovedOnCompletion = true
        shapeLayer.add(timerAnimation, forKey: "timerAnimation")
    }

}
