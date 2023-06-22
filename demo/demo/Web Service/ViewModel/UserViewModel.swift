//
//  UserViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import Foundation

class UserViewModel: NSObject {

    //MARK: - Variables
    let baseViewModel = BaseViewModel()
    var urlSessionGetViewControllerDelegate: URLSessionGetViewController?
    var urlSessionPostViewControllerDelegate: URLSessionPostViewController?
    var urlSessionPutViewControllerDelegate: URLSessionPutViewController?
    var urlSessionDeleteViewControllerDelegate: URLSessionDeleteViewController?

    //MARK: - Functions
    func getUserDataFromApi() {
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
    
    func addUser(employee: Employee) {
        baseViewModel.call(request: HttpRequestEnum.createResource, sendData: employee) {
            (response:Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPostViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
    
    func loginUser(user: UserRegister) {
        baseViewModel.call(request: HttpRequestEnum.login, sendData: user) {
            (response:Result<UserRegister, Error>) in
            switch response {
            case .success(let user):
                let status = (user.token != nil) ? "Login Status: Logged in" : "Login Status: Not Logged in"
                    self.urlSessionPostViewControllerDelegate?.getLoginStatus(status: status)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
    
    func updateUserWithPut(employee: Employee, id: Int) {
        baseViewModel.call(request: HttpRequestEnum.updatePut(id), sendData: employee) {
            (response:Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
    
    func updateUserWithPatch(employee: Employee, id: Int) {
        baseViewModel.call(request: HttpRequestEnum.updatePatch(id), sendData: employee) {
            (response:Result<Employee, Error>) in
            switch response {
            case .success(let employee):
                self.urlSessionPutViewControllerDelegate?.getResponse(response: employee)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
    
    func deleteUser(id: Int) {
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
}
