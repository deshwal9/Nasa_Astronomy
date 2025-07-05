//
//  TodaysView.swift
//  Nasa_Astronomy
//
//  Created by Ankit Deshwal on 01/07/2025.
//

import SwiftUI

struct TodaysView: View {
  // @Environment(\.safeAreaInsets) internal var safeAreaInsets
  @ObservedObject var vm = TodaysVM()
  var body: some View {
    NavigationStack() {
      GeometryReader { fullView in
        switch vm.pageState {
        case .loading:
          progressbarView
        case .error(let error):
          let _ = print("error: \(error)")
        case .loaded(let model):
          ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 8){
              VStack(alignment: .leading, spacing: 8){
                Text(model.title)
                  .font(.largeTitle)
                  .fontWeight(.bold)
                Text(model.date)
                  .font(.subheadline)
              }
              .padding(.horizontal, 10)
              if let imageUrl =  model.hdurl {
                VStack{
                  CacheAsyncImage(imageURL: imageUrl,scale: 0.8) { image in
                    image
                      .resizable()
                      .scaledToFill()
                      .contentShape(Rectangle())
                      .frame(maxWidth: fullView.size.width, maxHeight: fullView.size.height * 0.7)
                      .aspectRatio(contentMode: .fit)
                      .animation(.linear(duration: 0.5), value: image)
                  }
                }
              }
              Text(model.explanation)
                .font(.body)
                .padding(.horizontal, 10)
              
            }
            .frame(maxWidth: .infinity, maxHeight:.infinity )
          }
          .padding(.bottom, 10 )
          // .ignoresSafeArea(edges: .top)
          .frame(maxWidth: .infinity, maxHeight: .infinity)
          .background( Colors.backgroundColor.color )
        }
      }
    }
  }
  @ViewBuilder
  var progressbarView: some View {
    ProgressView()
      .progressViewStyle(
        CircularProgressViewStyle(tint: .red))
      .scaleEffect(2)
      .frame(maxWidth: .infinity, maxHeight: .infinity)
  }
}

#Preview {
  TodaysView()
}



//ScrollView(.vertical, showsIndicators: false) {
//  GeometryReader { proxy in
//  LazyVStack{
//    if let imageUrl =  model.hdurl {
//      VStack{
//        CacheAsyncImage(imageURL: imageUrl) { image in
//          image
//            .resizable()
//            .scaledToFit()
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//            .clipped()
//        }
//      }
//     // .ignoresSafeArea(edges: .top)
//    }
//    VStack(alignment: .leading, spacing: 8) {
//      Text(model.title)
//        .font(.largeTitle)
//        .fontWeight(.bold)
//      
//      Text(model.date)
//        .font(.subheadline)
//      
//      Text(model.explanation)
//        .font(.body)
//    }
//    .padding(.horizontal, 10)
//  }
//  .frame(maxWidth: .infinity, maxHeight: .infinity)
//}
//} .frame(maxWidth: .infinity, maxHeight: .infinity)
//.ignoresSafeArea(edges: .top)
