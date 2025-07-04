//
//  TodaysVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation
import SwiftUI

class TodaysVM: ObservableObject {
  @Injected private var networkService: NetworkProtocol
  // handle response
  @Published var model:AstroImageModel?
  // handle page state
  @Published var pageState: PageState = .loading
  
  enum PageState {
    case loading
    case loaded(model: AstroImageModel)
    case error(model:NetworkError)
  }
  
  init() {
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
        print(error)
      }
  }
  
}
