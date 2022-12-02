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
    
    var onReturn: (() -> Void)?
    
    private var dataSource: DataModel
    
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
        $0.addTarget(self, action: #selector(switchDevice), for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    private let dismissButton: UIButton = {
        $0.setImage(UIImage(named: "dismiss"), for: .normal)
        $0.addTarget(self, action: #selector(dismissSelf), for: .touchUpInside)
        
        return $0
    }(UIButton())
    
    // MARK: - Init
    
    init(dataSource: DataModel) {
        self.dataSource = dataSource
        super.init(nibName: nil, bundle: nil)
        
        configureDeviceSettings()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        
        view.addSubviews(
            impulseLabel,
            rythmLabel,
            innerPulseFrequencyView,
            pulseTimeView,
            pulsePeriodView,
            batteryView,
            switchButton,
            burstTimeView,
            burstPeriodView,
            dismissButton
        )
        
        [
            innerPulseFrequencyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            innerPulseFrequencyView.topAnchor.constraint(equalTo: impulseLabel.bottomAnchor, constant: 2),
            innerPulseFrequencyView.widthAnchor.constraint(equalToConstant: 282),
            innerPulseFrequencyView.heightAnchor.constraint(equalToConstant: 72),
            
            pulseTimeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            pulseTimeView.topAnchor.constraint(equalTo: innerPulseFrequencyView.bottomAnchor, constant: 2),
            pulseTimeView.widthAnchor.constraint(equalToConstant: 282),
            pulseTimeView.heightAnchor.constraint(equalToConstant: 72),
            
            pulsePeriodView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            pulsePeriodView.topAnchor.constraint(equalTo: pulseTimeView.bottomAnchor, constant: 2),
            pulsePeriodView.widthAnchor.constraint(equalToConstant: 282),
            pulsePeriodView.heightAnchor.constraint(equalToConstant: 72),
            
            batteryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            batteryView.topAnchor.constraint(equalTo: pulsePeriodView.bottomAnchor, constant: 54),
            batteryView.widthAnchor.constraint(equalToConstant: 136),
            batteryView.heightAnchor.constraint(equalToConstant: 24),
            
            switchButton.leadingAnchor.constraint(equalTo: innerPulseFrequencyView.trailingAnchor, constant: 80),
            switchButton.centerYAnchor.constraint(equalTo: pulsePeriodView.bottomAnchor),
            switchButton.widthAnchor.constraint(equalToConstant: 310),
            switchButton.heightAnchor.constraint(equalToConstant: 76),
            
            impulseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 86),
            impulseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            
            rythmLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            rythmLabel.centerYAnchor.constraint(equalTo: impulseLabel.centerYAnchor),
            rythmLabel.leadingAnchor.constraint(equalTo: switchButton.leadingAnchor),
            
            burstPeriodView.leadingAnchor.constraint(equalTo: rythmLabel.leadingAnchor),
            burstPeriodView.topAnchor.constraint(equalTo: rythmLabel.bottomAnchor, constant: 2),
            burstPeriodView.widthAnchor.constraint(equalToConstant: 282),
            burstPeriodView.heightAnchor.constraint(equalToConstant: 72),
            
            burstTimeView.leadingAnchor.constraint(equalTo: burstPeriodView.leadingAnchor),
            burstTimeView.topAnchor.constraint(equalTo: burstPeriodView.bottomAnchor, constant: 2),
            burstTimeView.widthAnchor.constraint(equalToConstant: 282),
            burstTimeView.heightAnchor.constraint(equalToConstant: 72),
            
            dismissButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            dismissButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor)
            
        ].forEach { $0.isActive = true }
    }
    
    // MARK: - Actions
    
    @objc private func switchDevice() {
        
        onReturn?()
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func dismissSelf() {
        dismiss(animated: true, completion: nil)
    }
}

// MARK: - Configuration

private extension SettingsViewController {
    
    func configureBattery() {
        let batteryService = dataSource.serviceList.filter { $0.uuid == ServiceIdentifiers.batteryStatus.cbuuid }
        guard let battery = batteryService.first else {
            print("Battery service not found")
            return
        }
        FitnessManager.shared.getCharacteristicsList(
            for: battery,
            with: nil) { charList, error in
            guard error == nil else {
                self.showAlert(error: error!)
                return
            }
            guard let batteryChar = charList.first else {
                print("Battery char not found")
                return
            }
            FitnessManager.shared.readValue(for: batteryChar) { value, error in
                guard error == nil else {
                    self.showAlert(error: error!)
                    return
                }
                
                switch value {
                case 0...16:
                    self.batteryView.configure(percent: value, image: UIImage(named: "battery0")!)
                case 17...39:
                    self.batteryView.configure(percent: value, image: UIImage(named: "battery17")!)
                case 40...69:
                    self.batteryView.configure(percent: value, image: UIImage(named: "battery40")!)
                case 70...99:
                    self.batteryView.configure(percent: value, image: UIImage(named: "battery70")!)
                case 100:
                    self.batteryView.configure(percent: value, image: UIImage(named: "battery100")!)
                default:
                    break
                }
            }
        }
    }
    
    // MARK: - Slider config
    
    private func configureDeviceSettings() {

    }
    
    private func setChannelControl(){
    }
    
    private func configureSlider(for characteristics: [CBCharacteristic]) {
        
    }
}

// MARK: - Alert

private extension SettingsViewController {
    
    func showAlert(error: FitnessError) {
        let alert = UIAlertController(
            title: "\(error.rawValue)",
            message: "Попробуйте еще раз",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ОК", style: .destructive, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    func showConfirmationAlert(
        for value: Int,
        length: Int,
        for characteristic: CBCharacteristic
    ) {
        let alert = UIAlertController(
            title: "Установлено значение",
            message: "\(value)",
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "ОК",
            style: .default
        ) { _ in
            FitnessManager.shared.writeValue(
                value: value,
                length: length,
                for: characteristic
            ) { writtenValue, error in
                guard error == nil else {
                    self.showAlert(error: error!)
                    return
                }
            }
            }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}
