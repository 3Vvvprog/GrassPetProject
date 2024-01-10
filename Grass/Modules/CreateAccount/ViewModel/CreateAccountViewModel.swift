//
//  CreateAccountViewModel.swift
//  Grass
//
//  Created Вячеслав Вовк on 10.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol CreateAccountViewModelProtocol {
    func moduleDidLoad()
}

class CreateAccountViewModel: CreateAccountViewModelProtocol {
    private var router: CreateAccountRouterProtocol
    
    init(router: CreateAccountRouterProtocol) {
        self.router = router
    }

    func moduleDidLoad() {

    }
}
