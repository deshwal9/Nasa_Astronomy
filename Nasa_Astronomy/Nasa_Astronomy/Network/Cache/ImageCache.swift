//
//  ImageCache.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/10/2025.
//
import Foundation
import SwiftUI

public final class ImageCache{
  static var cache:[URL : Image] = [:]
  
  // subscript to manage the cache
  static subscript (url: URL) -> Image? {
    get {
      return getImage(from: url)
    }
    set {
      guard let newValue = newValue else {
       return
      }
      saveImage(newValue, to: url)
    }
  }
  // Saving into dictionary
  static func saveImage(_ image: Image, to url: URL) {
    cache[url] = image
  }
  // getting from dictionary
  static func getImage(from url: URL) -> Image? {
    return cache[url]
  }
  
}
