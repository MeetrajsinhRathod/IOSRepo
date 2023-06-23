//
//  UpcomingMeetingsViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 13/06/23.
//

import UIKit
import Alamofire

class UpcomingMeetingsViewModel: NSObject {

    //MARK: - Functions
    
    /// Send http request to get
    /// - Parameters:
    ///   - page: page to request data from
    ///   - limit: limit for number of responses
    func getUpcomingMeetings(page: Int, limit: Int, completionHandler: @escaping (DataResponse<UpcomingMeetingsResponse, AFError>, [(key: String, values: [UpcomingMeetingsResult])] ) -> ())  {
        
        let authorization: HTTPHeaders = [.authorization(bearerToken: UserDefaultHelper.userToken)]
        AF.request(HttpRequestEnum.getUpcomingMeeting(page, limit).getTargetURL(), method: .get, headers: authorization).responseDecodable { [weak self] (response: DataResponse<UpcomingMeetingsResponse, AFError>) in
            
            var meetingList: [(key: String, values: [UpcomingMeetingsResult])] = []
            switch response.result {
            case .success(let meetingResponse):
                meetingList = self?.generateDateScheduleDictionary(meetingResult: meetingResponse.data.results) ?? []
            case .failure(_): meetingList = []
            }
            completionHandler(response, meetingList)
        }
    }

    /// function to group meetings according to their date
    /// - Parameter meetingResult: response from api
    /// - Returns: key value pair where key - date, value - scheduled meetings
    func generateDateScheduleDictionary(meetingResult: [UpcomingMeetingsResult]) -> [(key: String, values: [UpcomingMeetingsResult])] {
        var dictionary: [String: [UpcomingMeetingsResult]] = [:]
        meetingResult.forEach { result in
            if dictionary.isEmpty {
                dictionary[result.date.getFormattedDate()]?.append(result)
            }
            if dictionary.contains(where: { pair in
                pair.key == result.date.getFormattedDate()
            }) {
                dictionary[result.date.getFormattedDate()]?.append(result)
            }
            else {
                dictionary[result.date.getFormattedDate()] = [result]
            }
        }
        return dictionary.compactMap({ (key: $0, values: $1) })
    }

    /// function to cancel meeting
    /// - Parameters:
    ///   - id: meeting id
    func cancelMeeting(id: Int, completionHandler: @escaping (DataResponse<CancelMeetingResponse, AFError>) -> ()) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: UserDefaultHelper.userToken)]
        AF.request(HttpRequestEnum.cancelMeeting(id).getTargetURL(), method: .post, headers: authorization).responseDecodable {
            (response: DataResponse<CancelMeetingResponse, AFError>) in
            completionHandler(response)
        }
    }
}
