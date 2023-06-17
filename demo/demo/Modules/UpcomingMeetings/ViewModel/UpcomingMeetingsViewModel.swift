//
//  UpcomingMeetingsViewModel.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 13/06/23.
//

import UIKit
import Alamofire

class UpcomingMeetingsViewModel: NSObject {

    //MARK: - Variables
    weak var upcomingMeetingsVC: UpcomingMeetingsViewController?
    weak var cancelMeetingVC: CancelMeetingViewController?
    var baseViewModel = BaseViewModel()

    //MARK: - Functions
    func getUpcomingMeetings(userToken: String, page: Int, limit: Int) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: userToken)]
        AF.request(HttpRequestEnum.getUpcomingMeeting(page, limit).getTargetURL(), method: .get, headers: authorization).responseDecodable { [weak self] (response: DataResponse<UpcomingMeetingsResponse, AFError>) in
            switch response.result {
            case .success(let meetingResponse):
                self?.upcomingMeetingsVC?.upcomingMeetingsResponse(
                    response: self?.generateDateScheduleDictionary(meetingResult: meetingResponse.data.results) ?? [],
                    pages: meetingResponse.data.totalPages ?? 1
                )
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }

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

    func cancelMeeting(userToken: String, id: Int) {
        let authorization: HTTPHeaders = [.authorization(bearerToken: userToken)]
        AF.request(HttpRequestEnum.cancelMeeting(id).getTargetURL(), method: .post, headers: authorization).responseDecodable { [weak self]
            (response: DataResponse<CancelMeetingResponse, AFError>) in
            switch response.result {
            case .success(let cancelMeetingResponse):
                self?.cancelMeetingVC?.cancelMeetingResponse(response: cancelMeetingResponse)
            case .failure(let error):
                debugPrint("Error occured", error)
            }
        }
    }
}
