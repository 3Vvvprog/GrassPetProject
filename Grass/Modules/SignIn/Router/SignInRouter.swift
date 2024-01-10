//
//  SignInRouter.swift
//  Grass
//
//  Created Вячеслав Вовк on 05.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInRouterProtocol {
    func createAccount()
}

class SignInRouter: SignInRouterProtocol {
    weak var moduleViewController: UIViewController!
    
    func createAccount() {
        let createAccountController = CreateAccountAssembly().build()
        moduleViewController.navigationController?.pushViewController(createAccountController, animated: true)
    }
}
