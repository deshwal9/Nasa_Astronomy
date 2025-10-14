//
//  Icons.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

public enum Icons: String {
  case star
  case weekImage
  case calender
  case placeholder
  
  var value: String {
    switch self {
    case .star: return "moon.stars"
    case .weekImage : return "moon.stars.circle"
    case .calender : return "calendar.circle"
    case .placeholder: return "placeHolder"
    }
  }
  
  public var assetPath: String { self.value }

}
