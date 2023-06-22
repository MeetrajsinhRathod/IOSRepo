//
//  StringExtension.swift
//  demo
//
//  Created by Meetrajsinh Rathod on 22/06/23.
//

import Foundation

extension String {
    
    func getFormattedDateWithTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return "--"}
        dateFormatter.dateFormat = "dd-MMM-yyyy, HH:mm"
        return dateFormatter.string(from: date)
    }
    
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: self) else { return "--"}
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: date)
    }
    
    func convertToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        guard let date = dateFormatter.date(from: self) else { return Date()}
        return date
    }
}
