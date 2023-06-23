import SwiftMessages
import Alamofire

class AlertHelper {
    
    /// Show Error message
    ///
    /// - Parameter message: Error message
    class func showErrorMsg(title: String = "", message: String) {
        prepareAndShowAlert(title: title, message: message, type: .error)
    }
    
    /// Show Information message
    ///
    /// - Parameter message: Information Message
    class func showInfoMsg(title: String = "", message: String) {
        prepareAndShowAlert(title: title, message: message, type: .info)
    }
    
    /// Show Success message
    ///
    /// - Parameter message: Information Message
    class func showSuccessMsg(title: String = "", message: String) {
        prepareAndShowAlert(title: title, message: message, type: .success)
    }
    
    
    /// Get error from http response and present it
    /// - Parameter response: http response
    class func getErrorResponse<T:Codable>(response: DataResponse<T, AFError>) {
        do {
            let dataList = try JSONDecoder().decode(BaseErrorResponse.self, from: response.data ?? Data())
            AlertHelper.showErrorMsg(message: dataList.data.error ?? "Error occurred. Please try again")
        } catch let parsingError {
            debugPrint("Parsing Error", parsingError)
        }
    }
    
    /// This function will show alert message
    ///
    /// - Parameters:
    ///   - message: Message
    ///   - type: Theme (Message Type)
    private class func prepareAndShowAlert(title: String, message: String, type: Theme) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(type, iconStyle: .default)
        view.configureDropShadow()
        view.configureContent(title: title, body: message)
        view.button?.isHidden = true
        var viewConfig = SwiftMessages.defaultConfig
        viewConfig.duration = .seconds(seconds: 3)
        viewConfig.presentationContext = .window(windowLevel: .normal)
        SwiftMessages.show(config: viewConfig, view: view)
    }
}

