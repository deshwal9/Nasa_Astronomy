//
//  st.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 03/10/2025.
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
  static let getTodayAstroImageUrl = "/planetary/apod?api_key=%@"
  static let getAstroDataForDateUrl = "/planetary/apod?api_key=%@&date=%@"
   
}

class APIURL {
  static let baseUrl = NetworkManagerConstants.baseURL
  
  class func getTodayAstroImageUrl() -> String {
    let serviceURL = String(format:NetworkManagerConstants.getTodayAstroImageUrl, AppParam.configuration(.apiKey))
    //let serviceURL = NetworkManagerConstants.getTodayAstroImageUrl
      return baseUrl + serviceURL
  }
  class func getAstroDataForDateUrl(date: String) -> String {
    let serviceURL = String(format: NetworkManagerConstants.getAstroDataForDateUrl, AppParam.configuration(.apiKey), date)
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
