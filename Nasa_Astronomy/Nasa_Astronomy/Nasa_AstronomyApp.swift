//
//  Nasa_AstronomyApp.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

@main
struct Nasa_AstronomyApp: App {
  init() {
          // Register all dependencies at app launch
          DIContainer.shared.registerDependencies()
      }
    var body: some Scene {
        WindowGroup {
          TabBarView()
        }
    }
}
