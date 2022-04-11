//
//  LoginEntity.swift
//  pruebaAtos
//
//  Created by IOS_002 on 10/04/22.
//

import Foundation
import Alamofire

protocol LoginProtocol{
    func isValidLogin(isValid: Bool)
}

class LoginEntity{
    
    var delegate: LoginProtocol?
    
    func fetchData(data: LoginRequest){
        
        let request = Alamofire.request("https://www.mockachino.com/aa9bfef4-60ba-47/login?user=\(data.userName)&password=\(data.password)")
        
        request.responseJSON { response in
            
            let statusCode = (response.response?.statusCode)!
            
            
            if statusCode != 404{
                self.delegate?.isValidLogin(isValid: true)
            }else{
                self.delegate?.isValidLogin(isValid: false)
            }
            
        }
        
    }
}

struct LoginRequest{
    var userName: String
    var password: String
}
