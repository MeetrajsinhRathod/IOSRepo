//
//  SetStatusSheetViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import Foundation
import Alamofire

class SetStatusSheetViewModel: NSObject {

    //MARK: - Functions
    
    /// send http request to set status message for current user
    /// - Parameters:
    ///   - statusData: status message
    func setStatus(statusData: StatusData, completionHandler: @escaping (DataResponse<StatusResponse, AFError>) -> ()) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: UserDefaultHelper.userToken)]
        AF.request(HttpRequestEnum.setStatus(Int(UserDefaultHelper.userId) ?? 0).getTargetURL(), method: .patch, parameters: statusData, headers: authorization).responseDecodable {
            (response: DataResponse<StatusResponse, AFError>) in
            completionHandler(response)
        }
    }
}
