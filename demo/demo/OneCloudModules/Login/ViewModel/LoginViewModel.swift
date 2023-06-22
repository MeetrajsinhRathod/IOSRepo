//
//  LoginViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 12/06/23.
//

import UIKit
import Alamofire

class LoginViewModel: NSObject {

    //MARK: - Variables
    weak var oneCloudLoginVC: OneCloudLoginViewController?
    
    //MARK: - Functions
    
    /// function for http request to log user in
    /// - Parameter user: user credentials
    func loginUser(user: OneCloudUserLogin) {
        AF.request(HttpRequestEnum.oneCloudLogin.getTargetURL(), method: .post, parameters: user).responseDecodable { [weak self]
            (response: DataResponse<OneCloudLoginResponse, AFError>) in
            switch response.result {
            case .success(let loginResponse):
                self?.oneCloudLoginVC?.loginSuccess(response: loginResponse)
            case .failure(let error):
                AlertHelper.showErrorMsg(message: error.underlyingError?.localizedDescription ?? "Error occurred. Please try again")
                self?.oneCloudLoginVC?.loginFail()
            }
        }
    }
}
