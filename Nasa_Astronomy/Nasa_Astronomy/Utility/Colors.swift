//
//  Colors.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 04/10/2025.
//

import SwiftUI

public extension UIColor {
  static func from(_ color: Colors) -> UIColor? {
    UIColor(named: color.value, in: Bundle.main, compatibleWith: nil)
  }
}


public enum Colors: String {
  case backgroundColor
  var value:String {
    switch self {
    case .backgroundColor:
      return "background"
    }
  }
  
    var color: Color {
    return Color(self.value)
  }
}
