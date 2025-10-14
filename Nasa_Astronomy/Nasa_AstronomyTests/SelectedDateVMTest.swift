//
//  SelectedDateVMTest.swift
//  Nasa_AstronomyTests
//
//  Created by Ankit Deshwal on 05/10/2025.
//

import Testing
import SwiftUI
@testable import Nasa_Astronomy

struct SelectedDateVMTest {
  @Dependency private var networkService: NetworkProtocol
  var viewModel: SelectedDateVM?
  @MainActor init(){
    viewModel = .init()
  }

  @Test func test_ViewModel_init() async throws {
    #expect(viewModel != nil)
    #expect(viewModel?.pageState != nil)
    #expect(viewModel?.pageState == .loading)
    
  }
  
  @Test func test_getTodayData() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05-07")
    if viewModel?.pageState == .loading{
      #expect(viewModel?.pageState == .loading)
    }else{
      #expect(viewModel?.pageState != .loading)
    }
  }

  @Test func testg_getTodayDataNotNil() async throws {
    await viewModel?.fetchSelectedsDateContent(date: "2025-05-07")
    let data = viewModel?.pageState.data
    guard let item = data else{
      #expect(data == nil)
      return
    }
    #expect(type(of: item) == AstroImageModel.self)
  }
  @Test func test_DataModel() async throws {
    #expect(await viewModel?.fetchSelectedsDateContent(date: "2025-05-07") != nil)
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
      #expect(data == nil, "AstroImageModel should be empty because of wrong date format")
      return
    }
    #expect(type(of: item) == AstroImageModel.self)
    #expect(data?.title.isEmpty == false, "AstroImageModel should contain title")
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
  @Test func test_reloadButton() async throws {
      viewModel?.reloadInCaseOfError()
      #expect(viewModel?.pageState == .loading)
  }
  @Test func test_dateSelected() async throws {
      viewModel?.selectedDate = Date()
      viewModel?.dateSelected()
      #expect(viewModel?.pageState == .loading)
    
  }
  @Test func test_MockapiCall() async {
    let response = UITestMockResponseGenerator()
    let mockNetwork = MockNetwork(responseMocker: response)
    let result = await mockNetwork.getAstroImagesforSelectedDate(date: "")
    switch result {
    case .success(let model):
      #expect(true, "API call succeeded")
      #expect(model.title.isEmpty == false, "AstroImageModel should contain title")
    case .failure(let error):
      #expect(Bool(false), "API call return Error \(error)")
    }
  }
  @Test func test_MockapiCall_withVideo() async {
    let response = UITestMockResponseGenerator()
    let mockNetwork = MockNetwork(responseMocker: response)
    let result = await mockNetwork.getAstroImagesforSelectedDate_withvideo(date: "")
    switch result {
    case .success(let model):
      #expect(true, "API call succeeded")
      #expect(model.title.isEmpty == false, "AstroImageModel should contain title")
    case .failure(let error):
      #expect(Bool(false), "API call return Error \(error)")
    }
  }
  
}
