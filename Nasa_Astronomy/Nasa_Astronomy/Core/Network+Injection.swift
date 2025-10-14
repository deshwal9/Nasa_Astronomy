//
//  Network+Injection.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import Foundation

// MARK: - Dependency Registration
extension DIContainer {
    func registerDependencies() {
      let networkManager = AstronomyNetwork()
      if ProcessInfo.processInfo.arguments.contains("-UITEST"){
        register(NetworkProtocol.self) {
          MockNetwork(responseMocker: UITestMockResponseGenerator())
        }
      }else{
        register(NetworkProtocol.self) {
          networkManager
        }
      }
    }
}
