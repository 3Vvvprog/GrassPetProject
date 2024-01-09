//
//  SignInView.swift
//  Grass
//
//  Created by Вячеслав Вовк on 02.01.2024.
//

import UIKit
import SnapKit
import RxCocoa
import RxRelay
import RxSwift

class SignInView: UIView {
    // MARK: - Private properties
    
    var isPasswordSecured = PublishRelay<Bool>()
    private var disposeBag = DisposeBag()
    
    private var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход в аккаунт"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    var emailTextField = CustomTextField(placeholder: "Электронная почта")
    
    private var emailErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите почту"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    var passwordTextField = CustomTextField(placeholder: "Пароль")
    
    private var passwordErrorLabel: UILabel = {
        let label = UILabel()
        label.text = "Введите пароль"
        label.textColor = .systemRed
        label.font = UIFont.systemFont(ofSize: 12)
        label.isHidden = true
        return label
    }()
    
    var changePasswordSecuredButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    private var passwordSecuredImageView = UIImageView()
    
    
    private var dontRememberPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Не помню пароль", for: .normal)
        button.setTitleColor(MainConstanst.primaryСolor, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }()
    
    var signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = MainConstanst.primaryСolor
        button.layer.cornerRadius = 14
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Создать аккаунт", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = MainConstanst.primaryСolor.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 14
        button.setTitleColor(MainConstanst.primaryСolor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    
    private var signInWithHelpLabel: UILabel = {
        let label = UILabel()
        label.text = "Войти с помощью"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    private var signInWithHelpView = UIView()
    
    var googleButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.832, green: 0.862, blue: 0.871, alpha: 1).cgColor
        return button
    }()
    
    private var googleView = UIImageView()
    
    var vkButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 23
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.832, green: 0.862, blue: 0.871, alpha: 1).cgColor
        return button
    }()
    
    private var vkView = UIImageView()
    
    // MARK: - Private constants
    private enum Constants {
        static let leadingContainer = 16
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
        initialize()
        makeConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SignInView {
    func initialize() {
        addSubview(topLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(emailErrorLabel)
        addSubview(passwordErrorLabel)
        passwordTextField.isSecureTextEntry = true
        addSubview(dontRememberPasswordButton)
        addSubview(signInButton)
        addSubview(signUpButton)
        addSubview(signInWithHelpLabel)
        addSubview(signInWithHelpView)
        signInWithHelpView.addSubview(googleButton)
        googleButton.addSubview(googleView)
        googleView.image = UIImage.google
        signInWithHelpView.addSubview(vkButton)
        vkButton.addSubview(vkView)
        vkView.image = UIImage.vk
        passwordTextField.addSubview(changePasswordSecuredButton)
        changePasswordSecuredButton.addSubview(passwordSecuredImageView)
        passwordSecuredImageView.image = UIImage.closedEye
        
        
       
    }
    
    func makeConstraints() {
        topLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalToSuperview().offset(36)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(topLabel.snp.bottom).offset(32)
            make.height.equalTo(54)
        }
        
        
        emailErrorLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.bottom.equalTo(emailTextField.snp.bottom)
        }
        
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(emailErrorLabel.snp.bottom).offset(12)
            make.height.equalTo(54)
        }
        
        passwordErrorLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(emailErrorLabel.snp.bottom).offset(68)
        }
        
        dontRememberPasswordButton.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(passwordTextField.snp.bottom).offset(5)
        }
        
        signInButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(dontRememberPasswordButton.snp.bottom).offset(24)
            make.height.equalTo(54)
        }
        
        signUpButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.top.equalTo(signInButton.snp.bottom).offset(12)
            make.height.equalTo(54)
        }
        
        signInWithHelpLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signUpButton.snp.bottom).offset(16)
        }
        
        signInWithHelpView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(signInWithHelpLabel.snp.bottom).offset(16)
            make.width.equalTo(108)
            make.height.equalTo(46)
        }
        
        googleButton.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.height.width.equalTo(46)
        }
        
        googleView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(8)
            make.height.width.equalTo(30)
        }
        
        vkButton.snp.makeConstraints { make in
            make.top.trailing.bottom.equalToSuperview()
            make.height.width.equalTo(46)
        }
        
        vkView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview().inset(8)
            make.height.width.equalTo(30)
        }
        
        changePasswordSecuredButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(22)
        }
        
        passwordSecuredImageView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }
    
    
    
}

extension SignInView {
    func addErrorLabels() {
        
        emailErrorLabel.snp.removeConstraints()
        
        emailErrorLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(6)
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
        }
        
        passwordTextField.snp.updateConstraints { make in
            make.top.equalTo(emailErrorLabel.snp.bottom).offset(6)
        }
        
        dontRememberPasswordButton.snp.updateConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(17)
        }
        
        emailErrorLabel.isHidden = false
        passwordErrorLabel.isHidden = false
        self.layoutIfNeeded()
            
        
    }
    
    func removeErrorLabels() {
        
        emailErrorLabel.snp.removeConstraints()
        
        emailErrorLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.leadingContainer)
            make.bottom.equalTo(emailTextField.snp.bottom)
        }
        
        passwordTextField.snp.updateConstraints { make in
            make.top.equalTo(emailErrorLabel.snp.bottom).offset(12)
        }
        
        dontRememberPasswordButton.snp.updateConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom)
        }
        
        emailErrorLabel.isHidden = true
        passwordErrorLabel.isHidden = true
        self.layoutIfNeeded()
            
        
    }
    
    func bind() {
        isPasswordSecured
            .subscribe(onNext: { [unowned self] isSecure in
                if isSecure {
                    self.passwordSecuredImageView.image = UIImage.closedEye
                }else {
                    self.passwordSecuredImageView.image = UIImage.openedEye
                }
                self.passwordTextField.isSecureTextEntry = isSecure
            })
            .disposed(by: disposeBag)
    }
}




