//
//  WeekVM.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

class WeekVM: ObservableObject {
 @Injected private var networkService: NetworkProtocol
@Published  var text = ""
  
  init() {
    text = "sample text"
  }
  
}
