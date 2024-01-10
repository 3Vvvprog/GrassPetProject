//
//  CreateAccountViewController.swift
//  Grass
//
//  Created Вячеслав Вовк on 10.01.2024.
//  Copyright © 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {
    var viewModel: CreateAccountViewModelProtocol!
    private let topView = TopView()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.moduleDidLoad()
        view.backgroundColor = .white
        self.navigationItem.setHidesBackButton(true, animated: true)
        initialize()
        makeConstraints()
    }
    
}

private extension CreateAccountViewController {
    func initialize() {
        view.addSubview(topView)
        
        
    }
    
    func makeConstraints() {
        
        topView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(-30)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(60)
        }
        
    }
}
