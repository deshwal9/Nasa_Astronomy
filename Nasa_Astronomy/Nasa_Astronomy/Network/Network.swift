//
//  NetworkService.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//
import Foundation

class AstronomyNetwork: NetworkServiceProtocol {
  
  func fetchData(from url: URL, completion: @escaping (Result<Data, NetworkError>) -> Void) {
    let sessionConfiguration = URLSessionConfiguration.default
    sessionConfiguration.timeoutIntervalForRequest = 10
    sessionConfiguration.timeoutIntervalForResource = 10
    sessionConfiguration.waitsForConnectivity = false
    
    let session = URLSession(configuration: sessionConfiguration)
    
    let task = session.dataTask(with: url, ) { data, response, error in
      guard (response as? HTTPURLResponse)?.statusCode == 200 else {
        completion(.failure(NetworkError(errorType: .serverError)))
        return
      }
      if let networkError = error as? NetworkError {
        completion(.failure(networkError))
        return
      } else if let data = data {
        completion(.success(data))
      }
    }
    task.resume()
  }
  
  func fetchQuery(from url: String) async -> Result<Data, NetworkError> {
    guard let requestUrl = URL(string: url) else{
      return .failure(NetworkError(errorType: .badRequest))
    }
    return await withCheckedContinuation { continuation in
      self.fetchData(from: requestUrl) { result in
        continuation.resume(returning: result)
      }
    }
  }
  
}
