//
//  Nasa_AstronomyTests.swift
//  Nasa_AstronomyTests
//
//  Created by Ankit Deshwal on 30/06/2025.
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
  
  @Test func testgetTodayData() async throws {
    await viewModel?.fetchTodaysDateImage()
    if viewModel?.pageState == .loading{
      #expect(viewModel?.pageState == .loading)
    }else{
      #expect(viewModel?.pageState != .loading)
    }
   
  }

  @Test func testgetTodayDataNotNil() async throws {
    await viewModel?.fetchTodaysDateImage()
    let data = viewModel?.pageState.data
  }
  
  @Test func test_DataModel() async throws {
    await viewModel?.fetchTodaysDateImage()
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

  
}
