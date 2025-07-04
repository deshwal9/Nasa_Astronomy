//
//  Network+Protocol.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchData(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void)
}


// list of all request function
public protocol NetworkProtocol: AnyObject {
  func getTodayImage() async -> Result<AstroImageModel, NetworkError>
  func getAstroImagesForlastTenDaysImage() async -> Result<Data, NetworkError>
  func getAstroImagesforSelectedDate() async -> Result<Data, NetworkError>
}


