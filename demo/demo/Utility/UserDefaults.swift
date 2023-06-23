//
//  UserDefaultsBase.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 24/06/23.
//

import Foundation

@propertyWrapper
struct UserDefaultsWrapper<T> {
    let key : String
    let defaultValue : T
    
    init(key : String, defaultValue : T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    var wrappedValue : T {
        get { return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue }
        set { UserDefaults.standard.setValue(newValue, forKey: key) }
    }
}

private struct AppConstants {
    static let isUserLoggedIn = "isAlreadyLoggedIn"
    static let userToken = "authToken"
    static let userId = "userId"
}

class UserDefaultHelper {
    
    static let shared = UserDefaultHelper()
    
    private init() {}
    
    @UserDefaultsWrapper(key: AppConstants.isUserLoggedIn, defaultValue: false)
    static var isUserLoggedIn : Bool
    
    @UserDefaultsWrapper(key: AppConstants.userToken, defaultValue: "")
    static var userToken : String
    
    @UserDefaultsWrapper(key: AppConstants.userId, defaultValue: "")
    static var userId : String
}
