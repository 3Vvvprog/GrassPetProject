//
//  CreateAccountStep3View.swift
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

class CreateAccountStep3View: UIView {
    let isRunning = PublishRelay<Bool>()
    var timeValue = 3
    private var disposeBag = DisposeBag()
    
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
            Введите код из письма
            """
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        return label
    }()
    
    
    
    var codeTextField: UITextField = CustomTextField(placeholder: "4 цифры")
    var haveNoCodeLabel: UILabel = {
        let label = UILabel()
        label.text =
            """
            Не получил код 30 сек.
            """
        label.font = UIFont.systemFont(ofSize: 12)
        label.numberOfLines = 0
        label.textColor = UIColor(red: 0.417, green: 0.431, blue: 0.438, alpha: 1)
        return label
    }()
    
    var sentCodeAgainButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Отправить снова", for: .normal)
        button.setTitleColor(MainConstanst.primaryСolor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return button
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
        actionButton()
        bind()
        
    }
    
    enum Constants {
        static let containerPaddings: CGFloat = 16
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension CreateAccountStep3View {
    func initialize() {
        addSubview(topLabel)
        addSubview(descriptionLabel)
        addSubview(codeTextField)
        addSubview(haveNoCodeLabel)
        addSubview(sentCodeAgainButton)
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
        
        codeTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(descriptionLabel.snp.bottom).offset(8)
            make.height.equalTo(54)
        }
        
        haveNoCodeLabel.snp.makeConstraints { make in
            make.top.equalTo(codeTextField.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
        }
        
        sentCodeAgainButton.snp.makeConstraints { make in
            make.top.equalTo(haveNoCodeLabel.snp.bottom).offset(12)
            make.leading.equalToSuperview().inset(16)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(sentCodeAgainButton.snp.bottom).offset(24)
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


extension CreateAccountStep3View {
    func bind() {
        isRunning
            .flatMapLatest {  isRunning in
                isRunning ? Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance) : .empty()
            }
            .enumerated().flatMap { (index, int) in Observable.just(index) }
            .subscribe(onNext: { [weak self] time in
                self?.timeValue -= 1
                self?.haveNoCodeLabel.text =
            """
            Не получил код \(self?.timeValue.description ?? "30") сек.
            """
                
                if self?.timeValue == 0 {
                    self?.isRunning.accept(false)
                }
                
            })
            .disposed(by: disposeBag)
        
        isRunning
            .subscribe(onNext: { [weak self] isRun in
                self?.sentCodeAgainButton.isEnabled = !isRun
                self?.haveNoCodeLabel.isHidden = !isRun
                if !isRun {
                    self?.haveNoCodeLabel.snp.updateConstraints({ make in
                        make.top.equalTo(self!.codeTextField.snp.bottom).inset(22)
                    })
                    self?.snp.updateConstraints({ make in
                        make.height.equalTo(394)
                    })
                }else {
                    self?.haveNoCodeLabel.snp.updateConstraints({ make in
                        make.top.equalTo(self!.codeTextField.snp.bottom).offset(8)
                    })
                    self?.snp.updateConstraints({ make in
                        make.height.equalTo(424)
                    })
                }
            })
            .disposed(by: disposeBag)
        
    }
    
    func startTimer() {
        timeValue = 2
        updateTimerLabel()
        isRunning.accept(true)
    }
    
    private func updateTimerLabel() {
        haveNoCodeLabel.text =
            """
            Не получил код \(timeValue.description) сек.
            """
    }
}

private extension CreateAccountStep3View {
    func actionButton() {
        sentCodeAgainButton.rx.tap
            .subscribe(onNext: { [ weak self ] _ in
                self?.startTimer()
            })
            .disposed(by: disposeBag)
    }
}


