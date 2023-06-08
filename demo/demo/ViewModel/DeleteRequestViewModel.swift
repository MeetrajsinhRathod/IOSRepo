//
//  DeleteRequestViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import Foundation
import Alamofire

class DeleteRequestViewModel {
    
    //MARK: - Variables
    let baseViewModel = BaseViewModel()
    var urlSessionDeleteViewControllerDelegate: URLSessionDeleteViewController?
    
    //MARK: - Functions
    func deleteUserURLSession(id: Int) {
        baseViewModel.call(request: HttpRequestEnum.deleteResouce(id), sendData: nil) {
            (response:Result<DeleteStatus, Error>) in
            switch response {
            case .success(let status):
                self.urlSessionDeleteViewControllerDelegate?.getResponse(response: status)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
    
    func deleteUserAlamofire(id: Int) {
        AF.request(HttpRequestEnum.deleteResouce(id).getTargetURL(), method: .delete).response{ result in
            let status = (result.response?.statusCode == 204) ? "Resource deleted" : "Error occured: can not delete resource"
            self.urlSessionDeleteViewControllerDelegate?.getResponse(response: DeleteStatus(status: status))
        }
    }
}
