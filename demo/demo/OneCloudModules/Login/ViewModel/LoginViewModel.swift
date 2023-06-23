//
//  LoginViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit
import Alamofire

class LoginViewModel: NSObject {

    //MARK: - Functions
    
    /// function for http request to log user in
    /// - Parameter user: user credentials
    func loginUser(user: OneCloudUserLogin, completionHandler: @escaping (DataResponse<OneCloudLoginResponse, AFError>) -> ()) {
        
        AF.request(HttpRequestEnum.oneCloudLogin.getTargetURL(), method: .post, parameters: user).responseDecodable {
            (response: DataResponse<OneCloudLoginResponse, AFError>) in
            completionHandler(response)
        }
    }
}
