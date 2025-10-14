//
//  Nasa_AstronomyTests.swift
//  Nasa_AstronomyTests
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Testing
import SwiftUI
@testable import Nasa_Astronomy

struct TodaysVMTest {
  var viewModel: TodaysVM?
  @MainActor init(){
    viewModel = .init()
  }
  
  @Test func testViewModel_init() async throws {
    #expect(viewModel != nil)
    #expect(viewModel?.pageState != nil)
    #expect(viewModel?.pageState == .loading)
    
  }

  @Test func test_DataModel() async throws {
    #expect(await viewModel?.fetchTodaysDateImage() != nil)
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

  @Test func test_reloadButton() async throws {
      viewModel?.reloadInCaseOfError()
      #expect(viewModel?.pageState == .loading)
  }
  
  @Test func test_MockapiCall_Sucess() async {
    let response = UITestMockResponseGenerator()
    let mockNetwork = MockNetwork(responseMocker: response)
    let result = await mockNetwork.getTodayImage()
    switch result {
    case .success(let model):
      print(model)
      #expect(true)
    case .failure(let error):
      print(error)
      #expect(Bool(false))
    }
  }
 
  @Test func test_MockModelTesting() async {
    let mock = AstroImageModel(mock: true)
    #expect(mock.title == "sample")
  }
  
}
