//
//  WeekVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

class WeekVM: ObservableObject {
@Dependency private var networkService: NetworkProtocol
@Published  var text = ""
  
  init() {
    text = "sample text"
  }
  
}
