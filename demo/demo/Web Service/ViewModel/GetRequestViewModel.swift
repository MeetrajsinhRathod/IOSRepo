//
//  GetRequestViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import Foundation
import Alamofire

class GetRequestViewModel {
    
    //MARK: - Variables
    let baseViewModel = BaseViewModel()
    var urlSessionGetViewControllerDelegate: URLSessionGetViewController?
    
    //MARK: - Functions
    func getUserDataURLSession() {
        baseViewModel.call(request: HttpRequestEnum.getUserData, sendData: nil) {
            (response:Result<UserList, Error>) in
            switch response {
            case .success(let userList):
                self.urlSessionGetViewControllerDelegate?.getResponse(response: userList.data)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func getUserDataAlamofire() {
        AF.request(HttpRequestEnum.getUserData.getTargetURL()).responseDecodable { (response: DataResponse<UserList, AFError>) in
            switch response.result {
            case .success(let userList):
                debugPrint("Response:::::::",userList.data)
                self.urlSessionGetViewControllerDelegate?.getResponse(response: userList.data)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
}
