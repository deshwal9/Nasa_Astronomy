//
//  Untitled.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

protocol APODContent {
  var uid: UUID { get }
}
enum MediaType: String, Decodable {
 case video
 case image
}

public struct AstroImageModel: Decodable, APODContent {
    var uid = UUID()
    let date: String
    let explanation: String
    let hdurl: URL?
    let mediaType: MediaType
    let serviceVersion: String
    let title: String
    let url: URL?
    let copyright: String?
    var id: UUID {
      uid
     }

    enum CodingKeys: String, CodingKey {
        case date
        case explanation
        case hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title
        case url
        case copyright
    }
}
extension AstroImageModel{
  public init(mock: Bool = false){
    self.date = ""
    self.explanation = ""
    self.hdurl = nil
    self.mediaType = .image
    self.serviceVersion = ""
    self.title = "sample"
    self.url = nil
    self.copyright = nil
  }
}


