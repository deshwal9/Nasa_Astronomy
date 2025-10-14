//
//  Image+Extension.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//

import SwiftUI

public extension Image {
  
  static func icon(_ icon: Icons) -> Image {
    return Image(icon.rawValue)
  }
  static func systemIcon(_ icon: Icons) -> Image {
    return  Image(systemName: icon.value)
  }
  
  
}
