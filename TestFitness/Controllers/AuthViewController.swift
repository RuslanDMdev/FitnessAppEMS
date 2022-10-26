//
//  AuthViewController.swift
//  TestFitness
//
//  Created by Ruslan Dalgatov on 19.10.2022.
//


import UIKit
import SnapKit
//import FireBase

class AuthViewController: UIViewController {

    var window: UIWindow?
    let buttonStart = UIButton()
    let labelSingUp = UILabel()
    let emailField = UITextField()
    let passwordField = UITextField()
    let lineView = UIView()
    let lineView2 = UIView()
    let labelEmail = UILabel()
    let labelPassw = UILabel()


    private let signOutButton : UIButton = {
        let button = UIButton()
        button.backgroundColor = .green
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if FirebaseAuth.Auth.auth().currentUser != nil{
//            labelName.isHidden = true
//            emailField.isHidden = true
//            passwordField.isHidden = true
//            buttonStart.isHidden = true
//
//            view.addSubview(signOutButton)
//            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 50)
//            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
//        }
        
        view.backgroundColor = .white
        view.addSubview(buttonStart)
        view.addSubview(labelSingUp)
        view.addSubview(emailField)
        view.addSubview(passwordField)
        view.addSubview(labelEmail)
        view.addSubview(labelPassw)
        view.addSubview(lineView)
        view.addSubview(lineView2)

        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"bg")!)
        UIGraphicsBeginImageContext(self.view.frame.size)
          UIImage(named: "bg")?.draw(in: self.view.bounds)
          let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
          UIGraphicsEndImageContext()
          self.view.backgroundColor = UIColor(patternImage: image)
        
        
        let titlecolor = #colorLiteral(red: 0.3450980392, green: 0.3764705882, blue: 0.5333333333, alpha: 1)
        let buttoncolor = #colorLiteral(red: 0.3450980392, green: 0.3764705882, blue: 0.5333333333, alpha: 1)


        
        labelSingUp.text = "Sing Up"
        labelSingUp.font = UIFont.boldSystemFont(ofSize: 30)
        labelSingUp.snp.makeConstraints { maker in

            maker.top.equalTo(80)
            maker.centerX.equalToSuperview()
        }
        
        labelEmail.text = "Login"
        labelEmail.font = UIFont.boldSystemFont(ofSize: 16)
        labelEmail.textColor = titlecolor
        labelEmail.snp.makeConstraints { maker in
            maker.top.equalTo(labelSingUp).inset(145)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(300)
            
        }
        
        emailField.placeholder = "example@email.com"
        emailField.clearButtonMode = .whileEditing
        emailField.font = UIFont.boldSystemFont(ofSize: 20)
        emailField.snp.makeConstraints { maker in
            maker.top.equalTo(labelEmail).inset(25)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(300)

            
        }
        
        lineView.backgroundColor = .gray
        lineView.snp.makeConstraints { maker in
            maker.centerX.equalToSuperview()
            maker.width.equalTo(emailField)
            maker.height.equalTo(1)
            maker.bottom.equalTo(emailField).inset(-10)
        }
        
        labelPassw.text = "Password"
        labelPassw.font = UIFont.boldSystemFont(ofSize: 16)
        labelPassw.textColor = titlecolor
        labelPassw.snp.makeConstraints { maker in
            maker.top.equalTo(lineView).inset(45)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(300)
        }
        
        passwordField.placeholder = "********"
        passwordField.isSecureTextEntry = true
        passwordField.font = UIFont.boldSystemFont(ofSize: 20)
        passwordField.clearButtonMode = .whileEditing
        passwordField.snp.makeConstraints { maker in
            maker.top.equalTo(labelPassw).inset(25)
            maker.centerX.equalToSuperview()
            maker.width.equalTo(300)

        }
        
        lineView2.backgroundColor = .gray
        lineView2.snp.makeConstraints { maker in
            maker.centerX.equalTo(lineView)
            maker.width.equalTo(300)
            maker.height.equalTo(1)
            maker.bottom.equalTo(passwordField).inset(-10)
        }
        
        
        
        
        buttonStart.setTitle("Войти", for: .normal)
        buttonStart.backgroundColor = buttoncolor
        buttonStart.layer.cornerRadius = 5
        buttonStart.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        buttonStart.snp.makeConstraints { maker in
            maker.top.equalTo(lineView2).inset(100)
            maker.width.equalTo(300)
            maker.height.equalTo(50)
            maker.centerX.equalToSuperview()
        }
        buttonStart.addTarget(self, action: #selector(openViewController), for: .touchUpInside)

        
    }
    
    
    @objc func openNextView(){
       


//        let rootVC = UserViewController()
//        let nacVC = UINavigationController(rootViewController: rootVC)
//        nacVC.modalPresentationStyle = .fullScreen
//        present(nacVC, animated: true)

        
    }

//    @objc private func didTapButton(){
//        print("Continue button tapped")
//
//
//        guard let email = emailField.text, !email.isEmpty,
//              let password = passwordField.text, !password.isEmpty else{
//            print("Missing field data")
//            return
//        }
        
        // Get auth instanse
        // attempt sing in
        // if failorru, present alert to create account
        // if user continues,create account
        
        //chech sign in on app launch
        //allow user to sing out with button
        
//        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self]result, error in
//            guard let strongSelf = self else {
//                return
//            }
//
//            guard error == nil else{
//                //show accoun creation
//                strongSelf.showCreateAccount(email: email, password: password)
//                return
//            }
            
//            print("You have signed in")
            
//            let rootVC = UserViewController()
//            let nacVC = UINavigationController(rootViewController: rootVC)
//            nacVC.modalPresentationStyle = .fullScreen
//            self?.window?.rootViewController?.present(nacVC, animated: true)
//
            
//            strongSelf.labelName.isHidden = true
//            strongSelf.emailField.isHidden = true
//            strongSelf.passwordField.isHidden = true
//            strongSelf.buttonStart.isHidden = true
//
//            strongSelf.emailField.resignFirstResponder()
//            strongSelf.passwordField.resignFirstResponder()
//
//        })
//    }
    
//    func showCreateAccount(email: String, password: String){
//        let alert = UIAlertController(title: "Create Accaunt",
//                                      message: "Would you like to create an accaunt",
//                                      preferredStyle: .alert)
//
//        alert.addAction(UIAlertAction(title: "Continue",
//                                      style: .default,
//                                      handler: {_ in
//
//            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
//
//                guard let strongSelf = self else {
//                    return
//                }
//
//                guard error == nil else{
//                    //show accoun creation
//
//                    print("Account creation faild")
//                    return
//                }
//
//                print("You have signed in")
//                strongSelf.labelName.isHidden = true
//                strongSelf.emailField.isHidden = true
//                strongSelf.passwordField.isHidden = true
//                strongSelf.buttonStart.isHidden = true
//
//                strongSelf.emailField.resignFirstResponder()
//                strongSelf.passwordField.resignFirstResponder()
//            }
//
//        }))
//
//        alert.addAction(UIAlertAction(title: "Cancel",
//                                      style: .cancel,
//                                      handler: {_ in
//
//        }))
//
//        present(alert, animated: true)
//    }
    
//    @objc private func logOutTapped(){
//        do {
//            try FirebaseAuth.Auth.auth().signOut()
//            labelName.isHidden = false
//            emailField.isHidden = false
//            passwordField.isHidden = false
//            buttonStart.isHidden = false
//
//            signOutButton.removeFromSuperview()
//        }
//        catch {
//            print("An error occured")
//        }
//    }
    
    // MARK: - Open NextScreen
    
    @objc func openViewController() {
//        print("\(view.frame.size.width)")
        let rootVC = ViewController()
        let nacVC = UINavigationController(rootViewController: rootVC)
        nacVC.modalPresentationStyle = .fullScreen
        present(nacVC, animated: true)
    }
    
    // MARK: -

}


