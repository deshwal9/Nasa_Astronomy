//
//  Network+Extension.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//
import Foundation
import SwiftUI

extension AstronomyNetwork: NetworkProtocol {
  
/// Api request call for to get the Todays image
  func getTodayImage() async -> Result<AstroImageModel, NetworkError> {
    let url = APIURL.getTodayAstroImageUrl()
    let result = await self.fetchQuery(from: url)
    switch result {
    case .success(let successResponse):
      do {
        let content = try JSONDecoder().decode(AstroImageModel.self, from: successResponse)
        return .success(content)
      } catch {
        return .failure(NetworkError(errorType: .badRequest))
      }
    case .failure(let error):
      return .failure(error)
    }
  }
  
/// Api request call for to get the Astro  image for last 10 days
  func getAstroImagesForlastTenDaysImage(date: String) async -> Result<AstroImageModel, NetworkError> {
    let requestUrl = APIURL.getAstroDataForDateUrl(date: date)
    let result = await self.fetchQuery(from: requestUrl)
    switch result {
    case .success(let successResponse):
      do {
        let content = try JSONDecoder().decode(AstroImageModel.self, from: successResponse)
        return .success(AstroImageModel())
      } catch {
        return .failure(NetworkError(errorType: .generic))
      }
    case .failure(let error):
      return .failure(error)
    }
  }
/// Api request call for to get the Astro  image for selected date
  func getAstroImagesforSelectedDate(date: String) async -> Result<AstroImageModel, NetworkError> {
    let requestUrl = APIURL.getAstroDataForDateUrl(date: date)
    let result = await self.fetchQuery(from: requestUrl)
    switch result {
    case .success(let successResponse):
      do {
        let content = try JSONDecoder().decode(AstroImageModel.self, from: successResponse)
        return .success(content)
      } catch {
        return .failure(NetworkError(errorType: .badRequest))
      }
    case .failure(let error):
      return .failure(error)
    }
  }

}
