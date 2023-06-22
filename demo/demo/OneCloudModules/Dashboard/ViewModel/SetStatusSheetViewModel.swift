//
//  SetStatusSheetViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 21/06/23.
//

import Foundation
import Alamofire

class SetStatusSheetViewModel: NSObject {

    //MARK: - Variables
    weak var setStatusSheetVC: SetStatusSheetViewController?

    //MARK: - Functions
    
    /// send http request to set status message for current user
    /// - Parameters:
    ///   - userId: user id
    ///   - userToken: user token for authorization
    ///   - statusData: status message
    func setStatus(userId: String, userToken: String, statusData: StatusData) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: userToken)]
        AF.request(HttpRequestEnum.setStatus(Int(userId) ?? 0).getTargetURL(), method: .patch, parameters: statusData, headers: authorization).responseDecodable
        {
            [weak self] (response: DataResponse<StatusResponse, AFError>) in
            switch response.result {
            case .success(let response):
                self?.setStatusSheetVC?.apiSuccess(response: response.data)
            case .failure(let error):
                AlertHelper.showErrorMsg(message: error.underlyingError?.localizedDescription ?? "Error occurred. Please try again")
            }
        }
    }
}
