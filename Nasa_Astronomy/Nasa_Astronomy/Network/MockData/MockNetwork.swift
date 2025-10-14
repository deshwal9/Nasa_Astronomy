//
//  MockNetwork.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

public class MockNetwork: NetworkProtocol {
  
  var responseMocker: ResponseMocker
  
  public init(responseMocker: ResponseMocker) {
      self.responseMocker = responseMocker
  }
  
  public func getTodayImage() async -> Result<AstroImageModel, NetworkError> {
    Result.success(UITestMockResponseGenerator().getTodaysImageData!)
  }
 
  public func getAstroImagesForlastTenDaysImage(date: String) async -> Result<AstroImageModel, NetworkError> {
    Result.failure(NetworkError(errorType: .generic))
  }
  
  public func getAstroImagesforSelectedDate(date: String) async -> Result<AstroImageModel, NetworkError> {
    Result.success(UITestMockResponseGenerator().getImageForSelectedData!)
  }
  public func getAstroImagesforSelectedDate_withvideo(date: String) async -> Result<AstroImageModel, NetworkError> {
    Result.success(UITestMockResponseGenerator().getImageForSelectedData!)
  }

}
