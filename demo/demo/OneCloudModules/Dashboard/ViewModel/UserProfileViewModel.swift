//
//  UserProfileViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import Foundation
import Alamofire

class UserProfileViewModel: NSObject {
    
    //MARK: - Variables
    weak var userProfileVC: UserProfileViewController?
    
    //MARK: - Functions
    
    /// Http request to get user data
    /// - Parameter userToken: user token for authorization
    func getUserData(userToken: String) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: userToken)]
        AF.request(HttpRequestEnum.getUserInfo.getTargetURL(), method: .get, headers: authorization).responseDecodable { [weak self] (response: DataResponse<UserProfileResponse, AFError>) in
            switch response.result {
            case .success(let response):
                self?.userProfileVC?.apiSuccess(response: response.data[0])
            case .failure(let error):
                AlertHelper.showErrorMsg(message: error.underlyingError?.localizedDescription ?? "Error occurred. Please try again")
            }
        }
    }
}
