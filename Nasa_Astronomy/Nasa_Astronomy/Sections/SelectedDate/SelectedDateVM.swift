//
//  SelectedDateVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

class SelectedDateVM: ObservableObject {
  
  @Dependency private var networkService: NetworkProtocol
  
  // handle page state
  @Published var pageState: PageState = .loading
  
  @Published var selectedDate = Date() 
  @Published var showCalendar = false
  @Published var showAlert = false
  var error:NetworkError?
  
  
  init() {
  Task {
    await self.fetchSelectedsDateContent(date: selectedDate.toString)
    }
  }
  func dateSelected() {
    Task {
      await fetchSelectedsDateContent(date: selectedDate.toString)
    }
  }
  func reloadInCaseOfError() {
    showAlert = false
    Task {
      await fetchSelectedsDateContent(date: selectedDate.toString)
    }
  }
  
  func fetchSelectedsDateContent(date: String) async {
      let todayContent = await networkService.getAstroImagesforSelectedDate(date: date)

      switch todayContent {
      case .success(let success):
          await MainActor.run {
              pageState = .loaded(model: success)
          }
      case .failure(let error):
          await MainActor.run {
              self.error = error
              showAlert.toggle()
          }
      }
  }
 
  
}
