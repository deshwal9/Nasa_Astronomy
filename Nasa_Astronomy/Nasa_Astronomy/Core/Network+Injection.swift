//
//  Network+Injection.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

extension Resolver {
  //TODO: to check mock server
  public static func registerMyNetworkServices() {
    let networkManager = AstronomyNetwork()
    if ProcessInfo.processInfo.arguments.contains("-UITEST") ||  ProcessInfo.processInfo.arguments.contains("XCTestDevices"){
      Resolver.main.register {
        MockNetwork(responseMocker: UITestMockResponseGenerator())
      }.implements(NetworkProtocol.self)
    } else {
      Resolver.main.register { networkManager }
        .implements(NetworkProtocol.self)
    }
  }
}
