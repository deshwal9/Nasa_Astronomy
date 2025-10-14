//
//  Enums.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 05/10/2025.
//

enum PageState {
  case loading
  case loaded(model: AstroImageModel)
  
  var data : AstroImageModel? {
    switch self {
    case .loading:
      return nil
    case .loaded(model: let data):
      return data
    }
  }
}


extension PageState: Equatable {
    static func == (lhs: PageState, rhs: PageState) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case let (.loaded(data1), .loaded(data2)):
            return data1.id == data2.id // only compare 
        default:
            return false
        }
    }
}
