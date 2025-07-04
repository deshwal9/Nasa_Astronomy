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

public struct AstroImageModel: Decodable, APODContent {
    var uid = UUID()
    let date: String
    let explanation: String
    let hdurl: URL?
    let mediaType: String
    let serviceVersion: String
    let title: String
    let url: URL
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
    }
}
