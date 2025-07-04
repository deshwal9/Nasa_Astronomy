//
//  st.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 03/07/2025.
//
import Foundation

public enum AppConstants: String {
    case baseURL = "baseURL"
    case apiKey = "apiKey"
}

public struct AppParam {
  static let unableToReadPlist = "Unable to read plist"
  static public func configuration(_ key: AppConstants) -> String {
        guard let infoDict = Bundle.main.infoDictionary else {
            fatalError(unableToReadPlist)
        }
        return infoDict[key.rawValue] as? String ?? ""
    }
}

class NetworkManagerConstants {
  static let baseURL = "https://api.nasa.gov"
  static let getTodayAstroImageUrl = "/planetary/apod?api_key="
   
}

class APIURL {
  static let baseUrl = NetworkManagerConstants.baseURL
  
  class func getTodayAstroImageUrl() -> String {
      let serviceURL = NetworkManagerConstants.getTodayAstroImageUrl
      return baseUrl + serviceURL
  }
}

public enum ApiCallType {
  case todayAstroImage
  
  func returnType() -> Decodable.Type? {
    switch self {
    case .todayAstroImage:
      return AstroImageModel.self
    }
  }
}
