//
//  UserProfileViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import Foundation
import Alamofire

class UserProfileViewModel: NSObject {
    
    //MARK: - Functions
    
    /// Http request to get user data
    func getUserData(completionHandler: @escaping (DataResponse<UserProfileResponse, AFError>) -> ()) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: UserDefaultHelper.userToken)]
        AF.request(HttpRequestEnum.getUserInfo.getTargetURL(), method: .get, headers: authorization).responseDecodable { (response: DataResponse<UserProfileResponse, AFError>) in
            completionHandler(response)
        }
    }
}
