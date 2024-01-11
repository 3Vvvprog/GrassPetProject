//
//  CreateAccountStep2View.swift
//  Grass
//
//  Created by Вячеслав Вовк on 10.01.2024.
//

//
//  CreateAccountView.swift
//  Grass
//
//  Created by Вячеслав Вовк on 10.01.2024.
//

import UIKit
import SnapKit
import RxCocoa
import RxRelay
import RxSwift

class CreateAccountStep2View: UIView {
    
    private var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Создание аккаунта"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = 
            """
            На данную почту придёт письмо с кодом
            подтверждения
            """
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        return label
    }()
    
    var emailTextField: UITextField = CustomTextField(placeholder: "Электронная почта")
    
    var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.setTitle("Получить код", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = MainConstanst.primaryСolor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        button.layer.borderColor = MainConstanst.primaryСolor.cgColor
        button.setTitle("Назад", for: .normal)
        button.setTitleColor(MainConstanst.primaryСolor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 20
        initialize()
        makeConstraints()
        
    }
    
    enum Constants {
        static let containerPaddings: CGFloat = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CreateAccountStep2View {
    func initialize() {
        addSubview(topLabel)
        addSubview(descriptionLabel)
        addSubview(emailTextField)
        addSubview(continueButton)
        addSubview(backButton)
    }
    
    func makeConstraints() {
        topLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.containerPaddings)
            make.top.equalToSuperview().offset(36)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(topLabel.snp.bottom).offset(32)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.height.equalTo(54)
        }
        
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        backButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
    }
    
    
    
}


private extension CreateAccountStep2View {
    func actionButton() {
        
    }
}


