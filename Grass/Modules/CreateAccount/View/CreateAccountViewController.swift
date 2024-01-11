//
//  CreateAccountViewController.swift
//  Grass
//
//  Created Вячеслав Вовк on 10.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

class CreateAccountViewController: UIViewController {
    var viewModel: CreateAccountViewModelProtocol!
    private var disposeBag = DisposeBag()
    private let topView = TopView()
    private let createAccountView = CreateAccountView() // Выбор между Ищу работу/Ищу сотрудника
    private let createAccountStep2View = CreateAccountStep2View() // Ввод почты для регистрации
    private let createAccountStep3View = CreateAccountStep3View() // Проверка кода подтверждения

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.moduleDidLoad()
        view.backgroundColor = MainConstanst.backgroundColor
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        makeConstraints()
        buttonAction()
        bind()
    }
    
    deinit {
        print("Deinit")
    }
    
    private enum Constants {
        static let borderColor = UIColor(red: 184/255.0, green: 190/255.0, blue: 191/255.0, alpha: 1.000).cgColor
    }
}

private extension CreateAccountViewController {
    func initialize() {
        view.addSubview(topView)
        view.addSubview(createAccountView)
        view.addSubview(createAccountStep2View)
        createAccountStep2View.isHidden = true
        view.addSubview(createAccountStep3View)
        createAccountStep3View.isHidden = true
        
    }
    
    func makeConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
        createAccountView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(topView.snp.bottom).offset(32)
            make.height.equalTo(360)
        }
        
        createAccountStep2View.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(topView.snp.bottom).offset(32)
            make.height.equalTo(380)
        }
        
        createAccountStep3View.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(topView.snp.bottom).offset(32)
            make.height.equalTo(424)
        }
        
    }
    
    func buttonAction() {
        
        // CreateAccountView
        
        
        createAccountView.continueButton.rx.tap
            .subscribe(onNext: { [ unowned self ] _ in
                self.createAccountView.isHidden = true
                self.createAccountStep2View.isHidden = false
            })
            .disposed(by: disposeBag)
        
        createAccountView.backToSignInButton.rx.tap
            .subscribe(onNext: { [ unowned self ] _ in
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        // CreateAccountStep2View
        
        createAccountStep2View.continueButton.rx.tap
            .subscribe(onNext: { [ weak self ] _ in
//                if !self!.createAccountStep2View.emailTextField.text!.isEmail() {
//                    self?.createAccountStep2View.emailTextField.layer.borderColor = UIColor.systemRed.cgColor
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [ weak self]  in
//                        self?.createAccountStep2View.emailTextField.layer.borderColor = Constants.borderColor
//                    }
//                }else 
//                {
                    self?.createAccountStep2View.isHidden = true
                    self?.createAccountStep3View.isHidden = false
                
                    self?.createAccountStep3View.startTimer()
//                }
            })
            .disposed(by: disposeBag)
        
        createAccountStep2View.backButton.rx.tap
            .subscribe(onNext: { [ weak self ] _ in
                self?.createAccountView.isHidden = false
                self?.createAccountStep2View.isHidden = true
            })
            .disposed(by: disposeBag)
        
        
        // CreateAccountStep3View
        
        createAccountStep3View.continueButton.rx.tap
            .subscribe(onNext: { [ weak self ] _ in
                
            })
            .disposed(by: disposeBag)
        
        createAccountStep3View.backButton.rx.tap
            .subscribe(onNext: { [ weak self ] _ in
                self?.createAccountStep2View.isHidden = false
                self?.createAccountStep3View.isHidden = true
            })
            .disposed(by: disposeBag)
    }
    
    func bind() {
        
    }
}




