//
//  ViewController.swift
//  Grass
//
//  Created by Вячеслав Вовк on 25.12.2023.
// 

import UIKit
import SnapKit
import RxCocoa
import RxRelay
import RxSwift

class SignInViewUI: UIViewController {
    private let topView = TopView()
    private let signInView = SignInView()
    private var db = DisposeBag()
    var viewModel: SignInViewModelProtocol!
    
    private enum Constants {
        static let borderColor = UIColor(red: 184/255.0, green: 190/255.0, blue: 191/255.0, alpha: 1.000).cgColor
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.moduleDidLoad()
        view.backgroundColor = MainConstanst.backgroundColor
        initialize()
        makeConstraints()
        bind()
    }
    


}

private extension SignInViewUI {
    func initialize() {
        view.addSubview(topView)
        view.addSubview(signInView)
        
        
    }
    
    func makeConstraints() {
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        signInView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(topView.snp.bottom).offset(32)
            make.height.equalTo(526)
            make.width.equalTo(296)
        }
    }
    
    func bind() {
        
        signInView.signInButton.rx.tap.asDriver()
            .drive(onNext: { [unowned self] _ in
                self.didSignInButtonPressed()
            })
            .disposed(by: db)
        
        signInView.signUpButton.rx.tap.asDriver()
            .drive(onNext: { [unowned self] _ in
                print(1)
            })
            .disposed(by: db)
        
        signInView.googleButton.rx.tap.asDriver()
            .drive(onNext: { [unowned self] _ in
                print("google")
            })
            .disposed(by: db)
        
        signInView.vkButton.rx.tap.asDriver()
            .drive(onNext: { [unowned self] _ in
                print("vk")
            })
            .disposed(by: db)
            
    }
}

private extension SignInViewUI {
    func didSignInButtonPressed() {
        let email = signInView.emailTextField.text!
        let password = signInView.passwordTextField.text!
        
        signInView.signInButton.setTitle("Loading ...", for: .normal)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.signInView.signInButton.setTitle("Войти", for: .normal)
            
            let state = self.viewModel.isUserDataCorrect(email: email, password: password)
            switch state {
            case .emailNotFound:
                self.signInView.emailTextField.layer.borderColor = UIColor.systemRed.cgColor
                self.signInView.addErrorLabels()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.signInView.emailTextField.layer.borderColor = Constants.borderColor
                    self.signInView.removeErrorLabels()
                }
            case .failure:
                self.signInView.emailTextField.layer.borderColor = UIColor.systemRed.cgColor
                self.signInView.passwordTextField.layer.borderColor = UIColor.systemRed.cgColor
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.signInView.emailTextField.layer.borderColor = Constants.borderColor
                    self.signInView.passwordTextField.layer.borderColor = Constants.borderColor
                }
            case .success:
                print("Yes")
            default:
                break
            }
            
        }
        
    }
}


