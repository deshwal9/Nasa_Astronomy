//
//  Date+Extension.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/10/2025.
//


import Foundation

public extension Date {
  var toString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.calendar = Calendar(identifier: .gregorian)
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: self)
  }

  var toShowString: String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateStyle = .medium
    return dateFormatter.string(from: self)
  }
}
