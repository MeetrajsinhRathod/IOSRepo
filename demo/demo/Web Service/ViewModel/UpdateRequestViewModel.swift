//
//  PutRequestViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import Foundation
import Alamofire

class UpdateRequestViewModel {

    //MARK: - Variables
    let baseViewModel = BaseViewModel()
    var urlSessionPutViewControllerDelegate: URLSessionPutViewController?

    //MARK: - Functions
    func updateUserWithPutURLSession(employee: Employee, id: Int) {
        baseViewModel.call(request: HttpRequestEnum.updatePut(id), sendData: employee) {
            (response: Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func updateUserWithPatchURLSession(employee: Employee, id: Int) {
        baseViewModel.call(request: HttpRequestEnum.updatePatch(id), sendData: employee) {
            (response: Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func updateUserWithPutAlamofire(employee: Employee, id: Int) {
        AF.request(HttpRequestEnum.updatePut(id).getTargetURL(), method: .put, parameters: employee).responseDecodable { (response: DataResponse<Employee, AFError>) in
            switch response.result {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func updateUserWithPatchAlamofire(employee: Employee, id: Int) {
        AF.request(HttpRequestEnum.updatePatch(id).getTargetURL(), method: .patch, parameters: employee).responseDecodable { (response: DataResponse<Employee, AFError>) in
            switch response.result {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
}
