//
//  Meetings.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 13/06/23.
//

import Foundation

// MARK: - Response
struct UpcomingMeetingsResponse: Codable {
    let status: Int
    let data: UpcomingMeetingsData
    let message: String
}

// MARK: - Data Struct
struct UpcomingMeetingsData: Codable {
    let count, totalPages, currentPage: Int?
    let results: [UpcomingMeetingsResult]

    enum CodingKeys: String, CodingKey {
        case count
        case totalPages = "total_pages"
        case currentPage = "current_page"
        case results
    }
}

// MARK: - Result
struct UpcomingMeetingsResult: Codable {
    let occurrenceID: String
    let date: String
    let schedule: Schedule
    let user: ScheduleUser

    enum CodingKeys: String, CodingKey {
        case occurrenceID = "occurrence_id"
        case date, schedule, user
    }
}

// MARK: - Scheduled meeting
struct Schedule: Codable {
    let pk: Int
    let title: String
    let description: String
    let reminderTime: Int
    let timezone: String
    let startTime: String
    let duration: String
    let meetingType: MeetingType
    let passcode: String
    let user: String
    let roomID: String
    let enableChat, facialExpression, audioOnly, recordMeeting: Bool
    let transcribe, enableLobby, startMuted, enableTileView: Bool
    let requireCompanyInfo, requireRegistration, hideViewers: Bool
    let icsAttachment: String
    let uniqueRoom: Bool

    enum CodingKeys: String, CodingKey {
        case pk, title, description
        case reminderTime = "reminder_time"
        case timezone
        case startTime = "start_time"
        case duration
        case meetingType = "meeting_type"
        case passcode
        case user
        case roomID = "room_id"
        case enableChat = "enable_chat"
        case facialExpression = "facial_expression"
        case audioOnly = "audio_only"
        case recordMeeting = "record_meeting"
        case transcribe
        case enableLobby = "enable_lobby"
        case startMuted = "start_muted"
        case enableTileView = "enable_tile_view"
        case requireCompanyInfo = "require_company_info"
        case requireRegistration = "require_registration"
        case hideViewers = "hide_viewers"
        case icsAttachment = "ics_attachment"
        case uniqueRoom = "unique_room"
    }
}

enum MeetingType: String, Codable {
    case c = "C"
    case w = "W"
}

// MARK: - UserClass
struct ScheduleUser: Codable {
    let firstName: String
    let lastName: String
    let displayName: String
    let email: String
    let avatar: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case displayName = "display_name"
        case email, avatar
    }
}

struct CancelMeetingResponse: Codable {
    let status: Int
    let data: CancelMeetingData
    let message: String
}

struct CancelMeetingData: Codable {
    let message: String
}
