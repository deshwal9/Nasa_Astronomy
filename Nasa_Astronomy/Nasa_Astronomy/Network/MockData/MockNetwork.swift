//
//  MockNetwork.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

public class MockNetwork: NetworkProtocol {
  
  var responseMocker: ResponseMocker
  
  public init(responseMocker: ResponseMocker) {
      self.responseMocker = responseMocker
  }
  
  public func getTodayImage() async -> Result<AstroImageModel, NetworkError> {
    Result.failure(NetworkError(errorType: .generic))
  }
  
  public func getAstroImagesForlastTenDaysImage() async -> Result<Data, NetworkError> {
    Result.failure(NetworkError(errorType: .generic))
  }
  
  public func getAstroImagesforSelectedDate() async -> Result<Data, NetworkError> {
    Result.failure(NetworkError(errorType: .generic))
  }
  
}
