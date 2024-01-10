//
//  SignInAssembly.swift
//  Grass
//
//  Created Вячеслав Вовк on 05.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

//typealias SignInModule = (view: UIViewController, output: Action)

class SignInAssembly {

    func build() -> UIViewController {
        let view = SignInViewUI()
        let router = SignInRouter()
        let viewModel = SignInViewModel(router: router)
        
        view.viewModel = viewModel
        router.moduleViewController = view
        
        return view
    }

}
