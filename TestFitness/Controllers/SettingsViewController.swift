//
//  SettingsViewController.swift
//  FitnessEMS
//
//  Created by Ruslan Dalgatov on 11.10.2022.
//

import SnapKit
import CoreBluetooth
import UIKit

class SettingsViewController: UIViewController, UINavigationControllerDelegate {
    
    
    
    private let impulseLabel: UILabel = {
        $0.font = UIFont(name: "Avenir Next", size: 24)
        $0.text = "Импульс"
        $0.textColor = .black
        $0.textAlignment = .left
        
        return $0
    }(UILabel())
    
    private let rythmLabel: UILabel = {
        $0.font = UIFont(name: "Avenir Next", size: 24)
        $0.text = "Ритм"
        $0.textColor = .black
        $0.textAlignment = .left
        
        return $0
    }(UILabel())
    
    // MARK: - Slider subviews
    
    private lazy var innerPulseFrequencyView: SliderView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SliderView())
    
    private lazy var pulseTimeView: SliderView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SliderView())
    
    private lazy var pulsePeriodView: SliderView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SliderView())
    
    private lazy var burstPeriodView: SliderView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SliderView())
    
    private lazy var burstTimeView: SliderView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(SliderView())
    
    // MARK: - Battery
    
    private lazy var batteryView: BatteryView = {
        let view = BatteryView()
        
        return view
    }()
    
    // MARK: - Buttons
    
    private let switchButton: UIButton = {
        
        let title = NSAttributedString(
            string: "Отключить устройство",
            attributes: [.font : UIFont(name: "Avenir Next", size: 24)!,
                         .foregroundColor: UIColor.white])
        $0.setAttributedTitle(title, for: .normal)
        let titleHigh = NSAttributedString(
            string: "Отключить устройство",
            attributes: [.font : UIFont(name: "Avenir Next", size: 24)!,
                         .foregroundColor: UIColor.lightGray])
        $0.setAttributedTitle(titleHigh, for: .highlighted)
        $0.backgroundColor = Colors.switchButtonColor
        $0.layer.cornerRadius = 14
        $0.clipsToBounds = true
//        $0.addTarget(self, action: #selector(switchDevice), for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    private let dismissButton: UIButton = {
        $0.setImage(UIImage(named: "dismiss"), for: .normal)
//        $0.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    // MARK: - Init
    
   
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.bodyBack
        navigationController?.navigationBar.isHidden = true
        navigationController?.delegate = self
        setupSubviews()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.configureBattery()
        }
        
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .landscapeRight
    }
    
    // MARK: - UI
    
    private func setupSubviews() {
        
//            impulseLabel,
//            rythmLabel,
        view.addSubviews(innerPulseFrequencyView)
//            pulseTimeView,
//            pulsePeriodView,
//            batteryView,
//            switchButton,
//            burstTimeView,
//            burstPeriodView,
//            dismissButton

            innerPulseFrequencyView.snp.makeConstraints{ make in
                make.top.equalTo(100)
                make.width.equalTo(300)
                make.height.equalTo(100)
            }
    }
    
    // MARK: - Actions
    
    @objc private func switchDevice() {
       
    }
    
    @objc private func dismissSelf() {
    }
}

// MARK: - Configuration

private extension SettingsViewController {
    
    func configureBattery() {
             
        }
    }
    
    // MARK: - Slider config
    
    private func configureDeviceSettings() {

    }
    
    private func setChannelControl(){
    }
    
    private func configureSlider(for characteristics: [CBCharacteristic]) {
        
    }


// MARK: - Alert

private extension SettingsViewController {
    
    func showAlert() {

    }
    
    func showConfirmationAlert() {
     
    }
}
