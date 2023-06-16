//
//  PostRequestViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 08/06/23.
//

import Foundation
import Alamofire

class PostRequestViewModel {

    //MARK: - Variables
    let baseViewModel = BaseViewModel()
    var urlSessionPostViewControllerDelegate: URLSessionPostViewController?

    //MARK: - Functions
    func addUserURLSession(employee: Employee) {
        baseViewModel.call(request: HttpRequestEnum.createResource, sendData: employee) {
            (response: Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPostViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func loginUserURLSession(user: UserRegister) {
        baseViewModel.call(request: HttpRequestEnum.login, sendData: user) {
            (response: Result<UserRegister, Error>) in
            switch response {
            case .success(let user):
                let status = (user.token != nil) ? "Login Status: Logged in" : "Login Status: Not Logged in"
                self.urlSessionPostViewControllerDelegate?.getLoginStatus(status: status)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func addUserAlamofire(employee: Employee) {
        AF.request(HttpRequestEnum.createResource.getTargetURL(), method: .post, parameters: employee).responseDecodable { (response: DataResponse<Employee, AFError>) in
            switch response.result {
            case .success(let employee):
                self.urlSessionPostViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

    func loginUserAlamofire(user: UserRegister) {
        AF.request(HttpRequestEnum.login.getTargetURL(), method: .post, parameters: user).responseDecodable { (response: DataResponse<UserRegister, AFError>) in
            switch response.result {
            case .success(let user):
                let status = (user.token != nil) ? "Login Status: Logged in" : "Login Status: Not Logged in"
                self.urlSessionPostViewControllerDelegate?.getLoginStatus(status: status)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
}
