//
//  Network+Protocol.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}


// list of all request function
public protocol NetworkProtocol: AnyObject {
  func getTodayImage() async -> Result<AstroImageModel, NetworkError>
  func getAstroImagesforSelectedDate(date: String) async -> Result<AstroImageModel, NetworkError>
}


