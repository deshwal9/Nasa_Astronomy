//
//  TabBarModel.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

@MainActor
final class TabBarModel: ObservableObject {
  
  @Published var selection: Tab = .today
    
  init() {
    
  }
  
}
