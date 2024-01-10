//
//  SignInViewModel.swift
//  Grass
//
//  Created Вячеслав Вовк on 05.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import RxCocoa
import RxRelay
import RxSwift

protocol SignInViewModelProtocol {
    func moduleDidLoad()
    func isUserDataCorrect(email: String, password: String) -> LoginStates
    
    var isEmailValid: BehaviorRelay<Bool> { get set }
    
    func createAccount()
}



class SignInViewModel: SignInViewModelProtocol {
    
    
    private var router: SignInRouterProtocol
    private var dbService: SignInDBServiceProtocol!
    
    
    var isEmailValid = BehaviorRelay<Bool>(value: false)
    
    let disposeBag = DisposeBag()
    
    init(router: SignInRouterProtocol) {
        self.router = router
    }

    func moduleDidLoad() {
        dbService = SignInDbService()
    }
}

extension SignInViewModel {
    func isUserDataCorrect(email: String, password: String) -> LoginStates {
        return dbService.getLoginState(email: email, password: password)
    }
    
    func createAccount() {
        self.router.createAccount()
    }
    
}
