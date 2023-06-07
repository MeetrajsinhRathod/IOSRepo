//
//  BaseViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 05/06/23.
//

import Foundation

class BaseViewModel: NSObject {

    func call<T: Convertable>(request: HttpRequestEnum, sendData: T?, completionHandler: @escaping (Result<T, Error>) -> ()) {

        let urlSession = URLSession(configuration: URLSessionConfiguration.default)
        guard let url = URL(string: request.getTargetURL()) else { return }
        var urlRequest = request.setUrlRequest(url: url)

        if (sendData != nil) {
            request.setHttpBody(urlRequest: &urlRequest, jsonData: sendData?.convertToData())
        }

        urlSession.dataTask(with: urlRequest) { data, response, error in
            guard let data = data
                else {
                print(error?.localizedDescription ?? "Response Error")
                return
            }
            
            switch request {
            case HttpRequestEnum.deleteResouce(_):
                guard let httpUrlResponse = (response as? HTTPURLResponse) else { return }
                if httpUrlResponse.statusCode == 204 {
                    guard let deleteStatus = DeleteStatus(status: "Resource deleted") as? T else { return }
                    completionHandler(.success(deleteStatus))
                }
            default:
                do {
                    //JSON response
                    let jsonResponse = try JSONSerialization.jsonObject(with:
                            data, options: [])
                    print("JSON Response::::::::", jsonResponse)
                    //Decoded data
                    let decoder = JSONDecoder()
                    let dataList = try decoder.decode(T.self, from: data)
                    print("Datalist:::::::", dataList)
                    completionHandler(.success(dataList))
                } catch let parsingError {
                    completionHandler(.failure(parsingError))
                    debugPrint("Parsing Error", parsingError)
                }
            }
        }.resume()
    }
}
