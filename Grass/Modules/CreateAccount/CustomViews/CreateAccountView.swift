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

class CreateAccountView: UIView {
    
    private var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Создание аккаунта"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Для чего вы создаете аккаунт?"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        return label
    }()
    
    private var buttonsBorderView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.832, green: 0.862, blue: 0.871, alpha: 1).cgColor
        view.layer.cornerRadius = 14
        return view
    }()
    
    var searchJobButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Ищу работу", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.zPosition = 1000
        return button
    }()
    
    var searchWorkersButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("Ищу сотрудников", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.zPosition = 1000
        return button
    }()
    
    private var buttonsActiveView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = UIColor(red: 0.914, green: 0.929, blue: 0.938, alpha: 1)
        return view
    }()
    
    var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.setTitle("Продолжить", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = MainConstanst.primaryСolor
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    var backToSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 14
        button.layer.borderWidth = 1
        button.layer.borderColor = MainConstanst.primaryСolor.cgColor
        button.setTitle("Войти в аккаунт", for: .normal)
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

private extension CreateAccountView {
    func initialize() {
        addSubview(topLabel)
        addSubview(descriptionLabel)
        addSubview(buttonsBorderView)
        buttonsBorderView.addSubview(searchJobButton)
        buttonsBorderView.addSubview(searchWorkersButton)
        buttonsBorderView.addSubview(buttonsActiveView)
        addSubview(continueButton)
        addSubview(backToSignInButton)
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
        
        buttonsBorderView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.height.equalTo(54)
        }
        
        searchJobButton.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(4)
            make.trailing.equalTo(buttonsBorderView.snp.centerX).offset(-2)
        }
        
        searchWorkersButton.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(4)
            make.leading.equalTo(buttonsBorderView.snp.centerX).offset(2)
        }
        
        buttonsActiveView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(4)
            make.width.equalTo(searchJobButton.snp.width)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(buttonsBorderView.snp.bottom).offset(24)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
        
        backToSignInButton.snp.makeConstraints { make in
            make.top.equalTo(continueButton.snp.bottom).offset(12)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(54)
        }
    }
    
    
    
}


extension CreateAccountView {
    func setSearchJobActive() {
        buttonsActiveView.snp.removeConstraints()
        buttonsActiveView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(4)
            make.width.equalTo(searchJobButton.snp.width)
        }
        
        UIView.animate(withDuration: 0.6) {
            self.layoutIfNeeded()
        }
    }
    
    func setSearchWorkersActive() {
        buttonsActiveView.snp.removeConstraints()
        buttonsActiveView.snp.makeConstraints { make in
            make.trailing.top.bottom.equalToSuperview().inset(4)
            make.width.equalTo(searchJobButton.snp.width)
        }
        
        UIView.animate(withDuration: 0.6) {
            self.layoutIfNeeded()
        }
    }
}

