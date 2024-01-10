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
    private let createAccountView = CreateAccountView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.moduleDidLoad()
        view.backgroundColor = MainConstanst.backgroundColor
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        makeConstraints()
        buttonAction()
    }
    
    
}

private extension CreateAccountViewController {
    func initialize() {
        view.addSubview(topView)
        view.addSubview(createAccountView)
        
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
        
    }
    
    func buttonAction() {
        createAccountView.searchJobButton.rx.tap
            .subscribe(onNext: { [ unowned self ] _ in
                self.createAccountView.setSearchJobActive()
            })
            .disposed(by: disposeBag)
        
        createAccountView.searchWorkersButton.rx.tap
            .subscribe(onNext: { [ unowned self ] _ in
                self.createAccountView.setSearchWorkersActive()
            })
            .disposed(by: disposeBag)
        
        createAccountView.backToSignInButton.rx.tap
            .subscribe(onNext: { [ unowned self ] _ in
                self.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
    }
}


