//
//  AppDelegate+Injection.swift.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import Foundation

extension Resolver: ResolverRegistering {
  public static func registerAllServices() {
     registerMyNetworkServices()
  }
}
