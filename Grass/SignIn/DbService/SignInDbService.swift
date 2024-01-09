//
//  SignInDbService.swift
//  Grass
//
//  Created by Вячеслав Вовк on 04.01.2024.
//

import Foundation

protocol SignInDBServiceProtocol {
    func getLoginState(email: String, password: String) -> LoginStates
}


class SignInDbService {
   
}

extension SignInDbService: SignInDBServiceProtocol {
    
    func getLoginState(email: String, password: String) -> LoginStates {
        if email != "Test@mail.ru" {
            return .emailNotFound
        }else {
            if password != "123" {
                return .failure
            }
        }
        return .success
        
        
        
        
    }
    
    
}
