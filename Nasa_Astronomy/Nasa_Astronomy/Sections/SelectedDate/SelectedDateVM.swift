//
//  SelectedDateVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

class SelectedDateVM: ObservableObject {
  
  @Injected private var networkService: NetworkProtocol
  // handle response
  @Published var model:AstroImageModel?
  // handle page state
  @Published var pageState: PageState = .loading
  
  @Published var selectedDate = Date() 
  @Published var showCalendar = false
  
  enum PageState {
    case loading
    case loaded(model: AstroImageModel)
    case error(model:NetworkError)
  }
  
  init() {
  Task {
    await self.fetchSelectedsDateContent(date: selectedDate.toString)
    }
  }
  func dateSelected() {
    Task {
      await self.fetchSelectedsDateContent(date: selectedDate.toString)
    }
  }
  
  func fetchSelectedsDateContent(date: String) async  {
    let todayContent = await networkService.getAstroImagesforSelectedDate(date: date)
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
