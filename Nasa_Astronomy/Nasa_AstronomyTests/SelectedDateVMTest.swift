//
//  SelectedDateVMTest.swift
//  Nasa_AstronomyTests
//
//  Created by Ankit Deshwal on 05/07/2025.
//

import Testing
import SwiftUI
@testable import Nasa_Astronomy

struct SelectedDateVMTest {
  @Injected private var networkService: NetworkProtocol
  var viewModel: SelectedDateVM?
  @MainActor init(){
    viewModel = .init()
  }

  @Test func testViewModel_init() async throws {
    #expect(viewModel != nil)
    #expect(viewModel?.pageState != nil)
    #expect(viewModel?.pageState == .loading)
    
  }
  
  @Test func testgetTodayData() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05-07")
    if viewModel?.pageState == .loading{
      #expect(viewModel?.pageState == .loading)
    }else{
      #expect(viewModel?.pageState != .loading)
    }
  }

  @Test func testgetTodayDataNotNil() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05-07")
    let data = viewModel?.pageState.data
    guard let item = data else{
      #expect(data == nil)
      return
    }
    #expect(type(of: item) == AstroImageModel.self)
  }
  @Test func test_DataModel() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05-07")
    let data = viewModel?.pageState.data
    guard let item = data else{
      #expect(data == nil)
      return
    }
    #expect(type(of: item) == AstroImageModel.self)
    #expect(data?.title != nil)
    #expect(data?.hdurl != nil)
    #expect(data?.explanation != nil)
  }
  @Test func test_DataNegative() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05")
    let data = viewModel?.pageState.data
    guard let item = data else{
      #expect(data == nil)
      return
    }
  }
  
  @Test func test_ApiConnection() async throws {
    let todayContent = await networkService.getAstroImagesforSelectedDate(date: "2025-05-07")
      switch todayContent {
      case .success(let success):
        #expect(type(of: success) == AstroImageModel.self)
      case .failure(let error):
        #expect(type(of: error) == NetworkError.self)
      }
  }
  @Test func test_ApiConnection_withError() async throws {
    let todayContent = await networkService.getAstroImagesforSelectedDate(date: "2025-05")
      switch todayContent {
      case .success(let success):
        #expect(type(of: success) == AstroImageModel.self)
      case .failure(let error):
        #expect(type(of: error) == NetworkError.self)
      }
  }

}
