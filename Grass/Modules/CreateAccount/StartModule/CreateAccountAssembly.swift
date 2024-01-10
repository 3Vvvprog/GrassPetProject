//
//  CreateAccountAssembly.swift
//  Grass
//
//  Created Вячеслав Вовк on 10.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit


class CreateAccountAssembly {

    func build() -> UIViewController {
        let view = CreateAccountViewController()
        let router = CreateAccountRouter()
        let viewModel = CreateAccountViewModel(router: router)
        
        view.viewModel = viewModel
        router.moduleViewController = view
        
        return view
    }

}
