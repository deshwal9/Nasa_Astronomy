//
//  MockResponseGenerator.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//
import Foundation

public protocol ResponseMocker: AnyObject {
  
  var getTodaysImageData: Data? { get }
  var getImageForLastTenDayData: Data? { get }
  var getImageForSelectedData: Data? { get }
  
}

public class UITestMockResponseGenerator: ResponseMocker {
  public var getTodaysImageData: Data?{
    return MockResponseGenerator(fileName: "SameDay").getTodaysImageData
  }
  
  public var getImageForLastTenDayData: Data?{
    return MockResponseGenerator(fileName: "SameDay").getTodaysImageData
  }
  
  public var getImageForSelectedData: Data?{
    return MockResponseGenerator(fileName: "SameDay").getTodaysImageData
  }
}

public class MockResponseGenerator: ResponseMocker {
  
  let fileName: String
  
  public init(fileName: String) {
    self.fileName = fileName
  }
  
  public var getTodaysImageData: Data? {
     createMockResponseForSameDayImage()
  }
  
  public var getImageForLastTenDayData: Data?
  
  public var getImageForSelectedData: Data?
  
}

extension MockResponseGenerator {
  // MARK: mock response generator for same day data
  func createMockResponseForSameDayImage() -> Data? {
    return nil
  }
  
}
