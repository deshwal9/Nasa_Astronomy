//
//  TodaysVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation
import SwiftUI

class TodaysVM: ObservableObject {
  @Dependency private var networkService: NetworkProtocol
  
  // handle page state
  @Published var pageState: PageState = .loading
  @Published var showAlert = false
  var error:NetworkError? 
  
  init() {
  Task {
      await self.fetchTodaysDateImage()
    }    
  }
  
  func reloadInCaseOfError() {
    Task {
      await self.fetchTodaysDateImage()
    }
  }
  
  func fetchTodaysDateImage() async  {
      let todayContent = await networkService.getTodayImage()
      switch todayContent {
      case .success(let success):
        
        Task{ @MainActor in
          pageState = .loaded(model: success)
        }
      case .failure(let error):
        self.error = error
        showAlert.toggle()
      }
  }
  
}
