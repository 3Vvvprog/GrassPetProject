//
//  TopView.swift
//  Grass
//
//  Created by Вячеслав Вовк on 25.12.2023.
// Верхний нав бар

import UIKit
import SnapKit

class TopView: UIView {
    
    // MARK: - Private properties
    private let logoImage = UIImageView()
    private let searchIconImage = UIImageView()
    private let userConfigView = UIView()
    private let userConfigButton = UIButton()
    
    
    private let middleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Press", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        return button
    }()
    
    // MARK: - Private constants
    private enum UIConstants {
        static let logoWidth: CGFloat = 104
        static let logoHeight: CGFloat = 30
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
}

private extension TopView {
    func initialize() {
        backgroundColor = MainConstanst.primaryСolor
        addSubview(logoImage)
        logoImage.image = UIImage(named: "LOGO")
        
        addSubview(searchIconImage)
        searchIconImage.image = UIImage(systemName: "magnifyingglass")
        searchIconImage.tintColor = .white
       
        userConfigButtonLayout()
    }
    
    func makeConstraints() {
        logoImage.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview().inset(16)
            
        }
        
        searchIconImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(64)
            make.height.width.equalTo(25)
        }
    }
    
    
    // The right button (drop menu)
    func userConfigButtonLayout() {
        addSubview(userConfigView)
        userConfigView.backgroundColor = .clear
        
        
        userConfigButton.backgroundColor = .clear
        userConfigButton.layer.zPosition = 1000
        
        let line1 = UIView()
        userConfigView.addSubview(line1)
        line1.backgroundColor = .white
        line1.layer.cornerRadius = 1
        line1.layer.zPosition = 100
        
        let line2 = UIView()
        userConfigView.addSubview(line2)
        line2.backgroundColor = .white
        line2.layer.cornerRadius = 1
        line2.layer.zPosition = 100
        
        let line3 = UIView()
        userConfigView.addSubview(line3)
        line3.backgroundColor = .white
        line3.layer.cornerRadius = 1
        line3.layer.zPosition = 100
        
        
        userConfigView.addSubview(userConfigButton)
        
        
        userConfigView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalToSuperview()
            make.height.equalTo(20)
            make.width.equalTo(22)
            
        }
        
        userConfigButton.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
            
        }
        
        line1.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(3)
        }
        
        line2.snp.makeConstraints { make in
            make.leading.trailing.centerY.equalToSuperview()
            make.height.equalTo(3)
        }
        
        line3.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(3)
        }
    }
}
