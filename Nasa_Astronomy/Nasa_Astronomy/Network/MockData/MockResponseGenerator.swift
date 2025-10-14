//
//  MockResponseGenerator.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//
import Foundation

public protocol ResponseMocker: AnyObject {
  
  var getTodaysImageData: AstroImageModel? { get }
  var getImageForLastTenDayData: AstroImageModel? { get }
  var getImageForSelectedData: AstroImageModel? { get }
  var getImageForSelectedData_WithVideo: AstroImageModel? { get }
  
}

public class UITestMockResponseGenerator: ResponseMocker {
  public var getTodaysImageData: AstroImageModel?{
    return MockResponseGenerator(fileName: "SameDay").getTodaysImageData
  }
  
  public var getImageForLastTenDayData: AstroImageModel?{
    return MockResponseGenerator(fileName: "SameDay").getTodaysImageData
  }
  
  public var getImageForSelectedData: AstroImageModel?{
    return MockResponseGenerator(fileName: "GetSelectedDateMock").getImageForSelectedData
  }
  public var getImageForSelectedData_WithVideo: AstroImageModel?{
    return MockResponseGenerator(fileName: "GetSelectedDateMockVideo").getImageForSelectedData_WithVideo
  }
}

public class MockResponseGenerator: ResponseMocker {
 
  let fileName: String
  
  public init(fileName: String) {
    self.fileName = fileName
  }
  
  public var getTodaysImageData: AstroImageModel? {
     createMockResponseForSameDayImage()
  }
  
  public var getImageForLastTenDayData: AstroImageModel?{
    return AstroImageModel(mock: true)
  }
  
  public var getImageForSelectedData: AstroImageModel? {
    return createMockResponseForSameDayImage()
  }
  public var getImageForSelectedData_WithVideo: AstroImageModel?{
    return createMockResponseForSameDayImage()
  }
 
}

extension MockResponseGenerator {
  // MARK: mock response generator for same day data
  func createMockResponseForSameDayImage() -> AstroImageModel? {
      loadJsonFromFile(modelType: AstroImageModel.self)
  }

  func loadJsonFromFile<T: Decodable>( modelType: T.Type) -> T? {
      // Get the URL for the file in the bundle
      guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
          print("File not found!")
          return nil
      }
      
      do {
          // Load the data from the file
          let data = try Data(contentsOf: url)
          
          // Decode the JSON into the model
          let decoder = JSONDecoder()
          let decodedData = try decoder.decode(T.self, from: data)
          return decodedData
      } catch {
          print("Error loading or decoding data: \(error)")
          return nil
      }
  }

  
}
